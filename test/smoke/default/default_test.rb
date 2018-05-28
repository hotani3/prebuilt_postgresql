# # encoding: utf-8

# Inspec test for recipe prebuilt_postgresql::default
# Copyright:: 2018, Hiroshi OTANI

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe package('pgdg-centos96') do
  it { should be_installed }
end

describe package('postgresql96') do
  it { should be_installed }
end

describe package('postgresql96-server') do
  it { should be_installed }
end

describe service('postgresql-9.6') do
  it { should be_enabled }
  it { should be_running }
end

describe user('postgres') do
  it { should exist }
  its('shell') { should eq '/bin/bash' }
end

describe yum.repo('pgdg96') do
  it { should exist }
  it { should be_enabled }
end

describe command('psql -V') do
  its('stdout') { should match(/^psql \(PostgreSQL\) 9.6/) }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

describe command('sudo -i -u postgres psql -t -c "\du postgres"') do
  its('stdout') { should match(/^[[:blank:]]+postgres[[:blank:]]+/) }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

describe command('sudo -i -u postgres psql -t -c "\l postgres"') do
  its('stdout') { should match(/^[[:blank:]]+postgres[[:blank:]]+/) }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

describe directory('/var/lib/pgsql/9.6') do
  its('owner') { should eq 'postgres' }
  its('group') { should eq 'postgres' }
  its('mode') { should cmp '0700' }
end

describe directory('/var/lib/pgsql/9.6/data') do
  its('owner') { should eq 'postgres' }
  its('group') { should eq 'postgres' }
  its('mode') { should cmp '0700' }
end

%w(pg_hba.conf pg_ident.conf postgresql.conf).each do |conf|
  describe file("/var/lib/pgsql/9.6/data/#{conf}") do
    its('owner') { should eq 'postgres' }
    its('group') { should eq 'postgres' }
    its('mode') { should cmp '0600' }
  end
end
