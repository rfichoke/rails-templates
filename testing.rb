gem 'capybara',                :group => [:development, :test]
gem 'database_cleaner',        :group => [:development, :test]
gem 'cucumber-rails',          :group => [:development, :test]
gem 'cucumber',                :group => [:development, :test]
gem 'spork',                   :group => [:development, :test]
gem 'launchy',                 :group => [:development, :test]
gem 'factory_girl_rails',      :group => [:development, :test]
gem 'pickle',                  :group => [:development, :test]
gem 'rspec-rails', '>= 2.0.1', :group => [:development, :test]

environment <<EOF
  Rails.configuration.generators.options[:rails][:test_framework]      = :rspec
  Rails.configuration.generators.options[:rails][:fixture_replacement] = :factory_girl
  Rails.configuration.generators.options[:rspec][:fixture]             = true
  Rails.configuration.generators.options[:rspec][:views]               = false
  Rails.configuration.generators.options[:factory_girl][:dir]          = 'spec/factories'
EOF

generate 'rspec:install'
generate 'cucumber:install --rspec --capybara'

run 'spork --bootstrap'
gsub_file '.rspec', /--colour/, '--colour --drb'
gsub_file 'config/cucumber.yml', /std_opts = "/, 'std_opts = "--drb '
