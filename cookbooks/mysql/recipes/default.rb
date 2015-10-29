#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe "yum-mysql-community::mysql56"

package "mysql-community-server"
package "mysql-community-devel"

service "mysqld" do
  action [:start, :enable]
end
