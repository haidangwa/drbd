name 'drbd'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs/Configures drbd.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.10.1'

depends 'yum-elrepo'

%w(ubuntu debian redhat centos scientific oracle amazon).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/drbd' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/drbd/issues' if respond_to?(:issues_url)
