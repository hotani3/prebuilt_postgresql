#
# Cookbook:: prebuilt_postgresql
# Recipe:: server
#
# Copyright:: 2018, Hiroshi OTANI

include_recipe 'prebuilt_postgresql::yum_repo'

Chef::Recipe.send(:include, PrebuiltPostgreSQL::Server)
Chef::Resource.send(:include, PrebuiltPostgreSQL::Server)

yum_package package_name do
  action :install
  version node[:cookbook_name][:version]
end

execute setup_script_filename do
  environment 'PGSETUP_INITDB_OPTIONS' => \
              "--encoding=#{encoding} --locale=#{locale}"
  command "#{setup_script_path} initdb"
  action :nothing
  subscribes :run, "yum_package[#{package_name}]", :immediately
end

service service_name do
  action %i[enable start]
end
