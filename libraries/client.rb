module PostgreSQL
  module Client
    def package_name
      version = Version.new(node.default[:cookbook_name][:version])
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
