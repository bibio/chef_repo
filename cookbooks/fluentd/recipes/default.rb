#
# Cookbook Name:: fluentd
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

remote_file "td-agent-2.2.1-0.el7.x86_64.rpm" do
  source "http://packages.treasuredata.com.s3.amazonaws.com/2/redhat/7/x86_64/td-agent-2.2.1-0.el7.x86_64.rpm"
end

rpm_package "td-agent-2.2.1-0.el7.x86_64.rpm"

service "td-agent" do
  action [:enable, :start]
end
