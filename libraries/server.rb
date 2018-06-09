#
# Cookbook:: prebuilt_postgresql
# Library:: server
#
# Copyright:: 2018, Hiroshi OTANI

module PrebuiltPostgreSQL
  # Module for the 'server' recipe
  module Server
    def package_name
      version = Version.new(node['prebuilt_postgresql']['version'])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return 'postgresql96-server'
        end
      end
    end

    def setup_script_filename
      version = Version.new(node['prebuilt_postgresql']['version'])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return 'postgresql96-setup'
        end
      end
    end

    def setup_script_base
      version = Version.new(node['prebuilt_postgresql']['version'])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return '/usr/pgsql-9.6/bin/'
        end
      end
    end
    private :setup_script_base

    def setup_script_path
      setup_script_base + setup_script_filename
    end

    def service_name
      version = Version.new(node['prebuilt_postgresql']['version'])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return 'postgresql-9.6'
        end
      end
    end

    def encoding
      node['prebuilt_postgresql']['server']['encoding']
    end

    def locale
      node['prebuilt_postgresql']['server']['locale']
    end
  end
end
