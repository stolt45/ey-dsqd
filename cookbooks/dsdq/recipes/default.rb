require 'pp'
#
# Cookbook Name:: dsqd
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

execute "stop-monit" do
  command "pkill -9 monit"
  action :run
end

execute "start-monit" do
  command "telinit q"
  action :run
end
