#
# Cookbook:: postgresql
# Recipe:: server
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'postgresql::yum_repo'

Chef::Recipe.send(:include, PostgreSQL::Server)
Chef::Resource.send(:include, PostgreSQL::Server)

yum_package "#{package_name}" do
  action :install
  version node[:cookbook_name][:version]
end

execute "#{setup_script_filename}" do
  environment 'PGSETUP_INITDB_OPTIONS' => "--encoding=#{node[:cookbook_name][:server][:encoding]} --locale=#{node[:cookbook_name][:server][:locale]}"
  command "#{setup_script_path} initdb"
  action :nothing
  subscribes :run, "yum_package[#{package_name}]", :immediately
end

service "#{service_name}" do
  action [:enable, :start]
end
