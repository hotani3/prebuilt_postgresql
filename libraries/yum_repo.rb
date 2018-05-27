module PostgreSQL
  module YumRepo
    def package_name
      case node[:platform]
      when 'centos'
        return 'pgdg-centos'
      end
    end

    def package_filename
      version = Version.new(node[:cookbook_name][:version])
      case node[:platform]
      when 'centos'
        case version.short
        when '9.6'
          return 'pgdg-centos96-9.6-3.noarch.rpm'
        end
      end
    end

    def source_base
      version = Version.new(node[:cookbook_name][:version])
      platform_version = Version.new(node[:platform_version])
      case node[:platform_family]
      when 'rhel'
        case platform_version.major
        when 7
          # ex. rhel-7-x86_64
          basename = [node[:platform_family], platform_version.major, node[:kernel][:machine]].join('-')
          # ex. https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/
          return "https://download.postgresql.org/pub/repos/yum/#{version.short}/redhat/#{basename}/"
        end
      end
    end
    private :source_base

    def source_url
      return source_base + package_filename
    end
  end
end
