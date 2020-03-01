source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'spree', '~> 4.1.0.rc1'
gem 'spree_auth_devise', '~> 4.1.0.rc1'
gem 'spree_gateway', '~> 3.7'
gem 'delayed_job_active_record'
gem 'daemons'
gem 'capistrano3-delayed-job'
gem 'slim-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-local-precompile', require: false
  gem 'capistrano-db-tasks', require: false
#  gem 'capistrano-nginx', require: false
  gem 'capistrano-rails-db', require: false
  gem 'rails_email_preview', '~> 2.2.1'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
