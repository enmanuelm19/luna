require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'
require 'capistrano/nginx'
require "capistrano/scm/git"
require 'capistrano-db-tasks'
install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
