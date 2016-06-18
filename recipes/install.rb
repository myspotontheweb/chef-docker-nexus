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

user 'nexus' do
  uid 200
  system true
end

directory '/nexus-data' do
  owner 'nexus'
  mode '755'
end

docker_container 'nexus' do
  image 'sonatype/nexus3:latest'
  detach true
  port '8081:8081'
  env [
    "JAVA_MAX_HEAP=#{node['docker-nexus']['java-max-heap']}",
    "JAVA_MIN_HEAP=#{node['docker-nexus']['java-min-heap']}",
    "EXTRA_JAVA_OPTS=#{node['docker-nexus']['java-opts']}"
  ]
  volumes [
    "/nexus-data:/nexus-data"
  ]
  action :run
end

