#
# Cookbook:: postgresql_package
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

remote_file "#{Chef::Config[:file_cache_path]}/pgdg-centos96-9.6-3.noarch.rpm" do
  source 'https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm'
  not_if 'rpm -qa | grep -q "^pgdg-centos"'
  action :create
  notifies :install, 'rpm_package[pgdg-centos]', :immediately
end

rpm_package 'pgdg-centos' do
  source "#{Chef::Config[:file_cache_path]}/pgdg-centos96-9.6-3.noarch.rpm"
  action :nothing
end

yum_package 'postgresql96' do
  action :install
end

yum_package 'postgresql96-server' do
  action :install
end

execute 'postgresql96-setup::initdb' do
  environment 'PGSETUP_INITDB_OPTIONS' => '--encoding=UTF8 --locale=C'
  command '/usr/pgsql-9.6/bin/postgresql96-setup initdb'
  action :nothing
  subscribes :run, 'yum_package[postgresql96-server]', :immediately
end

systemd_unit 'postgresql-9.6.service' do
  action :start
  subscribes :enable, 'execute[postgresql96-setup::initdb]', :immediately
end
