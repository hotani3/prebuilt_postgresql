#
# Cookbook:: prebuilt_postgresql
# Library:: client
#
# Copyright:: 2018, Hiroshi OTANI

module PrebuiltPostgreSQL
  # Module for the 'client' recipe
  module Client
    def package_name
      version = Version.new(node['prebuilt_postgresql']['version'])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return 'postgresql96'
        end
      end
    end
  end
end
