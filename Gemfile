source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'bigdecimal', '~> 1.4'
gem 'pg'

group :development do
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
  gem 'pry', '~> 0.12.2'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
