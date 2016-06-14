#
# Cookbook Name:: docker-nexus
# Recipe:: docker
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt'

docker_service 'default' do
  action [:create, :start]
end

