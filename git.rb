run 'touch {tmp,log,vendor}/.gitkeep'

append_file ".gitignore", <<EOF
.DS_Store
config/database.yml
EOF

git :init
git :add => '.'
git :commit => '-a -m "Initial commit"'
