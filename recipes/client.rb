#
# Cookbook:: prebuilt_postgresql
# Recipe:: client
#
# Copyright:: 2018, Hiroshi OTANI

include_recipe 'prebuilt_postgresql::yum_repo'

Chef::Recipe.send(:include, PrebuiltPostgreSQL::Client)

yum_package package_name do
  action :install
  version node['prebuilt_postgresql']['version']
end
