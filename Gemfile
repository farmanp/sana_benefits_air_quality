source "http://rubygems.org"

gem "rake"
gem "sinatra", :require => ["sinatra/base"]
gem "sinatra-contrib"
gem "activerecord", :require => ["active_record"]
gem "faraday"
gem "dotenv"

platforms :ruby_18, :jruby do
  gem "require_relative"
  gem "rack", "1.4.1"
end


group :production do
  gem "mysql2", :platforms => :ruby
  gem "pg", :platforms => :ruby
  gem "puma", :platforms => :ruby
  gem "activerecord-jdbcpostgresql-adapter", :platforms => :jruby
  gem "trinidad", :platforms => :jruby
end

group :test, :development do
  gem "sqlite3", :platforms => :ruby
  gem "activerecord-jdbcsqlite3-adapter", :platforms => :jruby
end

group :test do
  gem "rspec"
end


group :development do
  gem "pry"
  gem "thin"
  gem "rubocop"
  gem "rubocop-git"
  gem "byebug"
end