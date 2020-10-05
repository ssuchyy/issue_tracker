source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'bigdecimal', '~> 1.4'
gem 'pg'
gem 'grape-entity'

gem "shrine", "~> 3.3"
gem 'aws-sdk-s3', '~> 1'

group :development do
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
  gem 'rubocop', require: false
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'pry', '~> 0.12.2'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'factory_bot'
  gem 'database_cleaner-sequel'
end

group :production do
  # gem 'puma'
end
