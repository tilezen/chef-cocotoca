#
# Cookbook Name:: cocotoca
# Recipe:: default
#
# Copyright 2017, Mapzen
#
# Available under the MIT license (see LICENSE for details)
#

%w(
  cocotoca::setup
  cocotoca::deploy
).each do |r|
  include_recipe r
end
