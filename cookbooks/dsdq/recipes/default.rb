require 'pp'
#
# Cookbook Name:: dsdq
# Recipe:: default
#

directory "/var/log/engineyard/dsqd" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

remote_file "/engineyard/bin/dsqd" do
  owner "root"
  group "root"
  mode 0755
  source "dsqd"
  action :create
end

remote_file "/etc/monit.d/dsqd.dictionarysquared.monitrc" do
  owner "root"
  group "root"
  mode 0755
  source "dsqd.dictionarysquared.monitrc"
  action :create
end

execute "restart-monit" do
  command "/etc/init.d/monit restart"
  action :run
end

