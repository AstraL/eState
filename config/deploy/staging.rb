server "46.101.146.42", port: 22, user: "deploy", roles: %w{app db web}, primary: true

set :branch, 'dev'
set :stage, :staging

set :nginx_server_name, "dev.e-state.com.ua"