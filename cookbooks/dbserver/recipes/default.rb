#
# Cookbook Name:: dbserver
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


remote_file '/tmp/mysql-community-release-el6-5.noarch.rpm' do
  source 'https://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm'
end

package 'mysql-community-release-el6-5.noarch.rpm' do
  source '/tmp/mysql-community-release-el6-5.noarch.rpm'
  provider Chef::Provider::Package::Rpm
end

package ['mysql-community-server', 'mysql-community-devel']

service 'mysqld' do
  action [:enable, :start]
end
