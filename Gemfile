source 'https://rubygems.org'

# core
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'

# active-record
gem 'ancestry'

# authentication
gem 'devise'

# assets
gem 'coffee-rails', '~> 4.2'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# api
gem 'jbuilder', '~> 2.5'
gem 'savon', '~> 2.12.0'

# security
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'brakeman', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'pry-rails'
  gem 'reek'
  gem 'rubocop'
  gem 'selenium-webdriver'
end

group :development do
  gem 'annotate'
  gem 'bundler-audit'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubycritic'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0' # call <%= console %> anywhere in the code.
end
