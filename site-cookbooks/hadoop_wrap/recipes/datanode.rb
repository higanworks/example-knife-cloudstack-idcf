name_node = search(:node, "role:hadoop-name AND chef_environment:#{node.chef_environment}").first
node.set['hadoop']['core_site']['fs.defaultFS'] = name_node[:fqdn]
