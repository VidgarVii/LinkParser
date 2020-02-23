# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'bundler'
gem 'rake'
gem 'rack'
gem 'sqlite3'               # DataBase
gem "otr-activerecord"      # ORM adapter
gem 'faraday'               # HTTP Client
gem 'nokogiri'              # HTTP Parser
gem 'activerecord-import'   # Bulk inserting data for using AR

group :development do
  gem 'pry', '~> 0.12.2'    # console. Use pry
end

group :test do
  gem 'rspec'               # unit-tests
  gem 'shoulda-matchers'    # helpers for testing validation
  gem 'database_cleaner-active_record' # DB cleaner
end
