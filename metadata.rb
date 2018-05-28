name 'prebuilt_postgresql'
maintainer 'Hiroshi OTANI'
maintainer_email 'hotani3@gmail.com'
license 'MIT'
description 'Installs prebuilt PostgreSQL'
long_description 'Installs prebuilt PostgreSQL server or client'
version '0.1.0'
chef_version '>= 13.4' if respond_to?(:chef_version)

supports 'centos', '>= 7.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/prebuilt_postgresql/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/prebuilt_postgresql'
