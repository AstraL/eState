server "46.101.146.42", port: 22, user: "deploy", roles: %w{app db web}, primary: true

set :branch, 'master'
set :stage, :production

set :nginx_server_name, "e-state.com.ua"
