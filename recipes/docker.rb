#
# Cookbook Name:: docker-nexus
# Recipe:: docker
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'docker-nexus::repo'

docker_service 'default' do
  install_method "package"
  action [:create, :start]
end

