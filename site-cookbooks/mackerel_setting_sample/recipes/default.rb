#
# Cookbook Name:: mackerel_setting_sample
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.
#

node.set_unless['mackerel-agent']['conf']['apikey'] = data_bag_item('mackerel', 'conf')['apikey']
node.set_unless['mackerel-agent']['conf']['roles'] = [node.chef_environment, node.roles].flatten.map {|r| ["My-Service", r].join(":")}

include_recipe 'mackerel-agent::default'
