gem "rails3-generators", :group => :development

environment "config.time_zone = 'Eastern Time (US & Canada)'"

remove_file 'public/index.html'
remove_file 'README'
file 'README', ''

run 'cp config/database.yml config/database-example.yml'
