require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'
require 'capistrano/local_precompile'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }

#require 'capistrano-db-tasks'
#require 'capistrano/nginx'
#require 'capistrano/rails/db'
