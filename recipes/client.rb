#
# Cookbook:: postgresql
# Recipe:: client
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'postgresql::yum_repo'

Chef::Recipe.send(:include, PostgreSQL::Client)

yum_package "#{package_name}" do
  action :install
  version node[:cookbook_name][:version]
end
