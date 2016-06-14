#
# Cookbook Name:: docker-nexus
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'docker-nexus::docker'
include_recipe 'docker-nexus::install'

