name 'prebuilt_postgresql'
maintainer 'Hiroshi OTANI'
maintainer_email 'hotani3@gmail.com'
license 'MIT'
description 'Installs prebuilt PostgreSQL'
long_description 'Installs prebuilt PostgreSQL client or server'
version '0.2.0'

chef_version '>= 14.0' if respond_to?(:chef_version)
supports 'centos', '>= 7.0'

source_url 'https://github.com/hotani3/prebuilt_postgresql'
