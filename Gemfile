source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem 'dotenv', '~> 3.1', '>= 3.1.2'
gem 'json', '~> 2.7', '>= 2.7.2'
gem 'rack-cors', '~> 2.0', '>= 2.0.2'
gem 'rails', '~> 7.1', '>= 7.1.3.2'
gem 'rest-client', '~> 2.1'
gem "pg", "~> 1.1"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'puma', '~> 6.4', '>= 6.4.2'

group :development, :test do
  gem "byebug"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'rubocop', '~> 1.63', '>= 1.63.5'
end
