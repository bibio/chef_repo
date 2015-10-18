#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

ruby_install_path = "/home/#{node[:ruby][:user]}/.rbenv/versions/#{node[:ruby][:ruby_version]}"

package %w(openssl-devel readline-devel zlib-devel)

git "/home/#{node[:ruby][:user]}/.rbenv" do
  repository node[:ruby][:rbenv_git_repository]
  revision 'master'
  user node[:ruby][:user]
end

directory "/home/#{node[:ruby][:user]}/.rbenv/plugins" do
  owner node[:ruby][:user]
end

git "/home/#{node[:ruby][:user]}/.rbenv/plugins/ruby-build" do
  repository node[:ruby][:ruby_build_git_repository]
  revision 'master'
  user node[:ruby][:user]
end

bash "insert rbenv's settings to ~/.bash_profile " do
  code <<-EOH
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/#{node[:ruby][:user]}/.bash_profile
  echo 'eval "$(rbenv init -)"' >> /home/#{node[:ruby][:user]}/.bash_profile
  EOH
  user node[:ruby][:user]
  not_if { ::File.read("/home/#{node[:ruby][:user]}/.bash_profile").include? 'eval "$(rbenv init -)"' }
end

bash "install ruby" do
  code <<-EOH
  export HOME="/home/#{node[:ruby][:user]}"
  export PATH="/home/#{node[:ruby][:user]}/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  rbenv install #{node[:ruby][:ruby_version]}
  rbenv global #{node[:ruby][:ruby_version]}
  EOH
  user node[:ruby][:user]
  not_if { ::File.exists?(ruby_install_path) }
end

bash "install bundler" do
  code <<-EOH
  export HOME="/home/#{node[:ruby][:user]}"
  export PATH="/home/#{node[:ruby][:user]}/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  gem install bundler --no-document
  rbenv rehash
  EOH
  user node[:ruby][:user]
end
