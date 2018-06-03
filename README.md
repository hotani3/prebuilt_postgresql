# Description
This cookbook installs prebuilt PostgreSQL client or server.

Installation steps are as follows.<br/>
https://www.postgresql.org/download/linux/redhat/

# Supported PostgreSQL version
* PostgreSQL 9.6

# Requirements
## Platform
* CentOS 7

## Chef
* Chef 13.4 or later

# Recipes & Attributes
## Recipes
| Recipe | Description |
| :----- | :--------- |
| prebuilt_postgresql | Same as the "prebuilt_postgresql::client" |
| prebuilt_postgresql::client | Installs PostgreSQL client |
| prebuilt_postgresql::server | Installs PostgreSQL server and initializes the database |

## Attributes
| Attribute | Type | Default value | Description |
| :-------- | :--- | :------------ | :---------- |
| node['prebuilt_postgresql']['version'] | String | "9.6.9" | PostgreSQL client or server version |
| node['prebuilt_postgresql']['server']['encoding'] | String | "UTF8" | Default database encoding |
| node['prebuilt_postgresql']['server']['locale'] | String | "C" | Default database locale |

# Usage
## Integrates with Vagrant (Omnibus & Berkshelf plugins are required)
#### chef-repo/Berksfile
```
source "https://supermarket.chef.io"

cookbook "prebuilt_postgresql"
```

#### Vagrantfile
```
Vagrant.configure("2") do |config|
  config.omnibus.chef_version = "13.6.4"
  config.berkshelf.berksfile_path = "chef-repo/Berksfile"
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "prebuilt_postgresql::client"
    chef.add_recipe "prebuilt_postgresql::server"
    chef.json = {
      "prebuilt_postgresql": {
        "version": "9.6.9"
      }
    }
  end
end
```

## Integrates with your cookbook
#### Berksfile
```
source "https://supermarket.chef.io"

cookbook "prebuilt_postgresql"
metadata
```

Refer to recipes in your role file,
#### roles/database.json
```
{
  "name": "database",
  "description": "PostgreSQL database server",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "default_attributes": {
  },
  "override_attributes": {
  },
  "run_list": [
    "recipe[prebuilt_postgresql::client]"
    "recipe[prebuilt_postgresql::server]"
  ]
}
```

Or include recipes in your recipe file.
#### recipes/default.rb
```
include_recipe "prebuilt_postgresql::client"
include_recipe "prebuilt_postgresql::server"
```
