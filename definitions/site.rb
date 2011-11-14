#
# Cookbook Name:: nginx
# Definition:: site
#

define :nginx_site, :enable => true do
  include_recipe "nginx2"
  
  enabledLink = File.join(node.nginx.dir, "sites-enabled", "#{params[:name]}.conf")
  configFile = File.join(node.nginx.dir, "sites-available", "#{params[:name]}.conf")
  
  if params[:enable]
    
    template configFile do 
      source "#{File.basename(configFile)}.erb"
    end
    
    link enabledLink do
      to configFile
      notifies :restart, resources(:service => "nginx")
    end
    
  else
    
    link enabledLink do
      to configFile
      action :delete
      notifies :restart, resources(:service => "nginx")
      only_if { ::File.symlink?(enabledLink) } 
    end
    
  end

end
