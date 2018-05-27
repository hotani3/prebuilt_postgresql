#
# Cookbook:: postgresql
# Recipe:: yum_repo
#
# Copyright:: 2018, The Authors, All Rights Reserved.
Chef::Recipe.send(:include, PostgreSQL::YumRepo)
Chef::Resource.send(:include, PostgreSQL::YumRepo)

# Refs: https://www.postgresql.org/download/linux/redhat/
remote_file "#{Chef::Config[:file_cache_path]}/#{package_filename}" do
  source "#{source_url}"
  not_if "rpm -qa | grep -q '^#{package_name}'"
  action :create
  notifies :install, "rpm_package[#{package_name}]", :immediately
end

rpm_package "#{package_name}" do
  source "#{Chef::Config[:file_cache_path]}/#{package_filename}"
  action :nothing
end
