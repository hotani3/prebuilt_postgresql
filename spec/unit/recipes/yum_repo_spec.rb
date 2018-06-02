#
# Cookbook:: prebuilt_postgresql
# Spec:: yum_repo
#
# Copyright:: 2018, Hiroshi OTANI

require 'spec_helper'

describe 'prebuilt_postgresql::yum_repo' do
  context 'When all attributes are default, on an CentOS 7.4.1708' do
    before do
      stub_command("rpm -qa | grep -q '^pgdg-centos'").and_return(false)
    end

    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '7.4.1708'
      )
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
