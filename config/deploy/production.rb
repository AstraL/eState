server "46.101.146.42", port: 22, user: "deploy", roles: %w{app db web}, primary: true

set :branch, :master
set :stage, :production

set :nginx_server_name, "e-state.com.ua"
set :nginx_config_name, "#{fetch(:application)}"
set :nginx_ssl_certificate, "/etc/letsencrypt/live/#{fetch(:nginx_server_name)}/fullchain.pem"
set :nginx_ssl_certificate_key, "/etc/letsencrypt/live/#{fetch(:nginx_server_name)}/privkey.pem"