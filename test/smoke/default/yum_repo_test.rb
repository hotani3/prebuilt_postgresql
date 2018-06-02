# Inspec test for recipe prebuilt_postgresql::yum_repo
# Copyright:: 2018, Hiroshi OTANI

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('pgdg-centos96') do
  it { should be_installed }
end

describe yum.repo('pgdg96') do
  it { should exist }
  it { should be_enabled }
end
