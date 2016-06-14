#
# Cookbook Name:: docker-nexus
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

docker_image 'sonatype/nexus3' do
  tag 'latest'
  read_timeout 600
  action :pull
end

docker_container 'nexus' do
  image 'sonatype/nexus3:latest'
  detach true
  port '8081:8081'
  action :run
end
