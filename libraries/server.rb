module PostgreSQL
  module Server
    def package_name
      version = Version.new(node[:cookbook_name][:version])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return 'postgresql96-server'
        end
      end
    end

    def setup_script_filename
      version = Version.new(node[:cookbook_name][:version])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return 'postgresql96-setup'
        end
      end
    end

    def setup_script_base
      version = Version.new(node[:cookbook_name][:version])
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
      return setup_script_base + setup_script_filename
    end

    def service_name
      version = Version.new(node[:cookbook_name][:version])
      case node[:platform_family]
      when 'rhel'
        case version.short
        when '9.6'
          return 'postgresql-9.6'
        end
      end
    end
  end
end
