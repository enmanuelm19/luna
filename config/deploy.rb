# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "luna"
set :repo_url, "git@github.com:enmanuelm19/luna.git"
set :user, 'enmanuel'
set :puma_threads, [4, 16]
set :puma_workers, 0
set :pty, true
set :use_sudo, false
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :rvm_type, :user
set :rvm_ruby_version, "2.6.3"
#set :nvm_type, :user
#set :nvm_node, "v9.8.0"
#set :nvm_map_bins, %w{node npm yarn}

set :db_local_clean, true
set :db_remote_clean, true
set :db_ignore_data_tables,  ["versions"]


set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/assets}

namespace :puma do
  desc 'Create directories for puma and sockets'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
  before :start, :make_dirs
end

namespace :deploy do
  desc 'Make sure local git is in sync with remote'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD s not the same as origin/master"
        puts "Run `git push` to sync changes"
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      #invoke 'nginx:stop'
      #invoke 'nginx:start'
      invoke 'puma:stop'
      invoke 'puma:start'
    end
  end

  before :starting, :check_revision
  #before "symlink:release", :yarn_deploy
  after:finishing, :compile_assets
  after :finishing, :cleanup
end
