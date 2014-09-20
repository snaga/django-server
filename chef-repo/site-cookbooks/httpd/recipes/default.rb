#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{httpd httpd-devel}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

