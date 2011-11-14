#
# Cookbook Name:: nginx2
# Recipe:: default
#

# NOTE: Ubuntu support only
#
apt_repository "nginx.list" do
  uri "http://ppa.launchpad.net/nginx/stable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
  action  :add
end

package "nginx" do
  version node.nginx.version
  action :upgrade
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template File.join(node.nginx.dir, "nginx.conf") do
  source "nginx.conf.erb"
  mode 0644
  notifies :restart, resources(:service => "nginx")
end

# Remove a link for default site
defaultLink = File.join(node.nginx.dir, "sites-enabled", "default")
link defaultLink do
  action :delete
  notifies :restart, resources(:service => "nginx")
  only_if { ::File.symlink?(defaultLink) }
end

