#
# Cookbook Name:: chef-docker-nexus
# Recipe:: repo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

case node['platform']
  when "ubuntu"
  
    include_recipe 'apt::cacher-client'

    apt_repository 'docker' do
      uri          'https://apt.dockerproject.org/repo'
      distribution "ubuntu-#{node['lsb']['codename']}"
      components   ['main']
      keyserver    'p80.pool.sks-keyservers.net'
      key          '58118E89F3A912897C070ADBF76221572C52609D'
    end
    
  else
    Chef::Log.fatal "Unsupported platform: '#{node['platform']}'"
    raise
end

