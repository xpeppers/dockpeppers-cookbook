include_recipe 'apt'
include_recipe 'docker'

package 'curl'
package 'git'

execute 'docker-compose' do
  command "curl -L https://github.com/docker/compose/releases/download/#{node['dockpeppers']['compose']['version']}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose"
end

cookbook_file '/etc/sysctl.conf' do
  source 'sysctl.conf'
  mode 00644
end

execute 'reload sysctl,conf' do
  command 'sysctl -p /etc/sysctl.conf'
end

