#
# Cookbook Name:: httpd
# Recipe:: django
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_package "python-devel" do
  action :install
end

cookbook_file "/tmp/get-pip.py" do
  mode 00644
  checksum "d43dc33a5670d69dd14a9be1f2b2fa27ebf124ec1b212a47425331040f742a9b"
end

bash "get_pip" do
  not_if { File.exists?("/usr/bin/pip") }
  code <<-EOC
python /tmp/get-pip.py
EOC
end

bash "pip_install_django" do
  not_if { File.exists?("/usr/bin/django-admin.py") }
  code <<-EOC
  pip install Django==1.6
EOC
end

cookbook_file "/tmp/mod_wsgi-4.3.0.rhel6.x86_64.tar.gz" do
  mode 00644
  checksum "126b594edfaa38a1098e219582e3d09cce18bd804dd9ba2be34f3ed5bedf65f7"
end

bash "tar_mod_wsgi" do
  not_if { File.exists?("/etc/httpd/modules/mod_wsgi.so") }
  code <<-EOC
  tar zxf /tmp/mod_wsgi-4.3.0.rhel6.x86_64.tar.gz -C /etc/httpd/modules
EOC
end

