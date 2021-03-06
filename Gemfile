source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# User registrations
gem 'devise', '~> 4.4', '>= 4.4.3'

# Bootstrap
gem 'bootstrap', '~> 4.0'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'

# JQuery
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

# Reset sequence - for proper seeds generation
gem 'activerecord-reset-pk-sequence', '~> 0.2.1'

# Chartkick (for charts)
gem 'chartkick', '~> 2.3', '>= 2.3.4'
gem 'groupdate', '~> 4.0'

# PDF generation
gem 'wkhtmltopdf-heroku', '~> 2.12', '>= 2.12.4.0'
gem 'wicked_pdf', '~> 1.1'

# Glyphicons
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'

# Pagination
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'will_paginate-bootstrap4', '~> 0.2.2'

# XLSX
gem 'axlsx', git: 'https://github.com/randym/axlsx.git'
gem 'axlsx_rails' # Provide templates for the axlsx gem

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '~> 1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
