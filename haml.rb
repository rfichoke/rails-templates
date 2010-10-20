gem 'haml'
gem 'haml-rails'

remove_file 'app/views/layouts/application.html.erb'

file 'app/views/layouts/application.html.haml', <<EOF
!!!Strict
%html{ :lang => 'en' }
  %head
    %meta(http-equiv='content-type' content='text/html; charset=UTF-8')
    %title
      = yield :title || 'Untitled'
    = yield :head

  %body
    - if flash[:notice]

    %p.notice= notice
    %p.alert= alert

    = yield :body
EOF

environment "Rails.configuration.generators.options[:rails][:template_engine] = :haml"
