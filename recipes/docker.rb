include_recipe 'apt'
include_recipe 'docker'

cookbook_file '/etc/sysctl.conf' do
    source 'sysctl.conf'
      mode 00644
end

execute 'reload sysctl,conf' do
    command 'sysctl -p /etc/sysctl.conf'
end

