require 'inifile'
idcfrc = IniFile.load(File.join(ENV['HOME'], ".idcfrc"))

knife[:cloudstack_url] = idcfrc['account']['host']
knife[:cloudstack_api_key] = idcfrc['account']['api_key']
knife[:cloudstack_secret_key] = idcfrc['account']['secret_key']

knife[:cloudstack_zone] = 'a117e75f-d02e-4074-806d-889c61261394' ## tesla zone
knife[:identity_file] = ENV['SSH_KEYFILE']
knife[:keypair]       = ENV['SSH_KEYPAIR']
knife[:ssh_user]      = "root"

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                ENV['CHEF_USER']
client_key               "#{current_dir}/#{ENV['CHEF_USER']}.pem"
validation_client_name   "#{ENV['CHEF_ORGNAME']}-validator"
validation_key           "#{current_dir}/#{ENV['CHEF_ORGNAME']}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{ENV['CHEF_ORGNAME']}"
cache_type               'BasicFile'
cache_options( :path => "#{current_dir}/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

