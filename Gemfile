# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'dotenv-rails', group: :development
gem 'pg', '0.21.0'
gem 'puma', '~> 3.11'

gem 'dry-struct'
gem 'dry-validation'

gem 'typhoeus'
gem 'faraday'
gem 'faraday_middleware'

gem 'activesupport'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec'
  gem 'guard-rspec'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
