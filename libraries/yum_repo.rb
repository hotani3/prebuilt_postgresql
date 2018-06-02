#
# Cookbook:: prebuilt_postgresql
# Library:: yum_repo
#
# Copyright:: 2018, Hiroshi OTANI

module PrebuiltPostgreSQL
  # Module for the 'yum_repo' recipe
  module YumRepo
    def package_name
      case node[:platform]
      when 'centos'
        'pgdg-centos'
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
        return source_base_for_rhel_family(platform_version, version)
      end
    end
    private :source_base

    def source_base_for_rhel_family(platform_version, postgresql_version)
      yum_repo = 'https://download.postgresql.org/pub/repos/yum'
      case platform_version.major
      when 7
        # ex. rhel-7-x86_64
        basename = [
          node[:platform_family],
          platform_version.major,
          node[:kernel][:machine]
        ].join('-')
        # ex. https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64
        source_base = [
          yum_repo,
          postgresql_version.short,
          'redhat',
          basename
        ].join('/')
        return source_base
      end
    end
    private :source_base_for_rhel_family

    def source_url
      # ex. https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
      [source_base, package_filename].join('/')
    end
  end
end
