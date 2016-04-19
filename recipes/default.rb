#
# Author:: Matt Ray <matt@chef.io>
# Cookbook Name:: drbd
# Recipe:: default
#
# Copyright 2009, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# prime the search to avoid 2 masters
node.save unless Chef::Config[:solo]

case node['platform_family']
when 'rhel', 'fedora', 'suse'
  include_recipe 'yum-elrepo' unless node['drbd']['custom_repo'] == true
end

drbd_packages = value_for_platform_family(
  ['rhel', 'fedora', 'suse'] => ['kmod-drbd84', 'drbd84-utils'],
  ['default', 'debian'] => ['drbd8-utils']
)

drbd_packages.each do |pack|
  package pack do
    action :install
  end
end

service 'drbd' do
  supports(
    restart: true,
    status: true
  )
  action :nothing
end
