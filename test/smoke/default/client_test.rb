# # encoding: utf-8

# Inspec test for recipe prebuilt_postgresql::client
# Copyright:: 2018, Hiroshi OTANI

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('postgresql96') do
  it { should be_installed }
end

describe command('psql -V') do
  its('stdout') { should match(/^psql \(PostgreSQL\) 9.6/) }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end
