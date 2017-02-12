source 'https://rubygems.org'

'ruby 2.2.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use pg as the database for Active Record
#gem 'mysql2', '~> 0.3.18'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'activesupport-json_encoder'

# session storage in database table
gem 'activerecord-session_store'
# Use jquery as the JavaScript library
gem "jquery-rails", "~> 2.3.0"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
#user authentication
gem 'devise'
# hamal
gem "haml-rails", "~> 0.9"
# disign fremwork
gem "twitter-bootstrap-rails"
# mail preview
gem "letter_opener"
# file upload plug in
gem "carrierwave", github: 'carrierwaveuploader/carrierwave'
# video upload
gem 'carrierwave-video'
gem 'carrierwave-ffmpeg'
gem 'carrierwave-video-thumbnailer'
gem 'carrierwave-audio'
gem 'jw_player_helper'
# Geocode address
gem 'geocoder'
gem 'remotipart', '~> 1.2'
# Autocomplete
gem 'rails4-autocomplete'

# chalt feature
gem 'private_pub'
gem 'thin'
# for aws cloud storage
gem 'fog'

#social media login facebook
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem "omniauth-google-oauth2"
gem 'omniauth-linkedin'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-nav'
  gem 'therubyracer'
  gem 'pry'
  # pretty console outpul
  gem 'hirb'
  gem 'capistrano', '~> 3.4'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1', '>= 1.1.5'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano-passenger', '~> 0.2.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

