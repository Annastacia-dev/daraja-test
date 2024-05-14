source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.4"

gem "cors", "~> 1.0"
gem 'dotenv'
gem 'json'
gem "rack-cors", "~> 1.1"
gem "rack", "~> 2.2"
gem "rails", "~> 7.0.4"
gem "rest-client", "~> 2.1"
gem "sqlite3", "~> 1.4"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "puma", "~> 5.0"
gem 'uri'

group :development, :test do
  gem "byebug"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'rubocop', '~> 1.63', '>= 1.63.5'
end
