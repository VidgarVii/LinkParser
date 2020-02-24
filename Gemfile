source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.7.0'

gem 'activerecord-import'   # Bulk inserting data for using AR
gem 'bundler'
gem 'faraday'               # HTTP Client
gem 'nokogiri'              # HTTP Parser
gem 'otr-activerecord'      # ORM adapter
gem 'rack'
gem 'rake'
gem 'sqlite3'               # DataBase

group :development do
  gem 'pry', '~> 0.12.2'    # console. Use pry
end

group :test do
  gem 'database_cleaner-active_record' # DB cleaner
  gem 'fuubar'
  gem 'rspec'                          # unit-tests
  gem 'shoulda-matchers'               # helpers for testing validation
end
