source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails',      '~> 6.1.4'
gem 'pg',         '~> 1.1'
gem 'puma',       '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker',  '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'redis',      '~> 4.0'
gem 'bootsnap',   '>= 1.4.4', require: false
gem 'ffi', github: 'ffi/ffi', submodules: true

gem 'whenever', require: false

gem 'devise'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop',     '~> 1.18', require: false
end

group :development do
  gem 'web-console',        '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen',             '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
