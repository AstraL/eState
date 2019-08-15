set :repo_url,        'git@github.com:AstraL/eState.git'
set :user,            'deploy'
set :application, 		"estate_#{fetch(:stage)}"
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind, 			"unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_conf, "#{shared_path}/config/puma.rb"

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/assets public/packs public/system public/uploads storage node_modules}
set :db_dump_dir, "./db"

set :config_files, %w{config/database.yml}
set :config_example_suffix, '.example'

set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"
set :nginx_flags, 'fail_timeout=0'
set :nginx_http_flags, fetch(:nginx_flags)
set :nginx_socket_flags, fetch(:nginx_flags)
set :nginx_use_ssl, true

namespace :config do
	desc "copy config/master.key to shared/config"
	task :key do
		on roles(:app) do
			sudo :mkdir, "-pv", shared_path
			upload! "config/master.key", "#{shared_path}/config/master.key"
			sudo :chmod, "600", "#{shared_path}/config/master.key"
		end
  end
end

namespace :deploy do
		desc "Make sure local git is in sync with remote."
		task :check_revision do
				on roles(:app) do
						unless `git rev-parse HEAD` == `git rev-parse origin/master`
								puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
								puts "Run `git push` to sync changes."
								exit
						end
				end
    end

    desc "Create db"
    task create: [:set_rails_env] do
			on fetch(:migration_servers) do
				within release_path do
					with rails_env: fetch(:rails_env) do
						execute :rake, 'db:create'
					end
        end
      end
    end

		before :starting,     :check_revision
		before 'deploy:check:linked_files', 'config:push'
		before 'deploy:check:linked_files', "config:key"
		before 'deploy:migrate', 'deploy:create'
		after  :finishing,    'puma:nginx_config'
		after  :finishing,    :cleanup
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma