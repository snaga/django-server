#!/bin/sh

cat <<EOF > solo.rb
file_cache_path "/tmp/chef-solo"
cookbook_path ["$PWD/site-cookbooks"]
role_path "$PWD/roles"
EOF

chef-solo -c solo.rb -j nodes/localhost.json

