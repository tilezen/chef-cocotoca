#
# Cookbook Name:: cocotoca
# Recipe:: setup
#
# Copyright 2017, Mapzen
#
# Available under the MIT license (see LICENSE for details)
#

user_account node[:cocotoca][:user][:name] do
  create_group true
  only_if { node[:cocotoca][:user][:enabled] }
end

include_recipe 'apt'

%w(
  git
  python-dev
  libgeos-dev
  libpq-dev
  python-pip
  gunicorn
).each do |p|
  package p
end

package 'python-gevent' do
  action :install
  only_if { node[:cocotoca][:gunicorn][:worker_class] == 'gevent' }
end

package 'python-tornado' do
  action :install
  only_if { node[:cocotoca][:gunicorn][:worker_class] == 'tornado' }
end

directory node[:cocotoca][:cfg_path]
directory node[:cocotoca][:run_path] do
  owner node[:cocotoca][:user][:name]
end

gunicorn_config "#{node[:cocotoca][:cfg_path]}/gunicorn.cfg" do
  action :create
  listen node[:cocotoca][:gunicorn][:listen]
  pid "#{node[:cocotoca][:run_path]}/gunicorn.pid"
  worker_class node[:cocotoca][:gunicorn][:worker_class]
  worker_processes node[:cocotoca][:gunicorn][:worker_processes]
  worker_timeout node[:cocotoca][:gunicorn][:worker_timeout]
end
