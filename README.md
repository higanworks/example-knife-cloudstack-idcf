# Example: knife-cloudstack on idcf cloud

Create cluster using `knife cs stack`.

## Requirements

- `~/.idcfrc`. See http://docs.idcf.jp/cloud/#a_getting_use
- Chef-Server (Hosted Chef recommended.)

## Setup local
 
### knife-cloudstack
 
with chef-dk.
 
```
$ chef gem install knife-cloudstack
```
 
with bundler. (executables will be installed at `./bin/`)
 
```
$ bundle install --binstubs --path vendor/bundle
```

## Configure

### Chef credincails

- put pem for validation to `.chef/{orgname}-validator.pem`.
- put pem for chef user to `.chef/{username}.pem`.


### Environment variables.

copy `env.sh.sample` as `env.sh` and fill it.


```env.sh.sample
export CHEF_USER="Hosted chef UserName"
export CHEF_ORGNAME="Hosted chef Org Name"

export SSH_KEYFILE="Full path of ssh private keyfile"
export SSH_KEYPAIR="IDCF Keypair name"
```

like below.

```env.sh
export CHEF_USER="sawanoboly"
export CHEF_ORGNAME="idcf_test"

export SSH_KEYFILE="/path/to/ssh/private_key"
export SSH_KEYPAIR="idcf_key01"
```
and export these as environment variables.

`source env.sh`


## Setup Chef-Server

```
$ (./bin/)berks vendor cookbooks
$ (./bin/)knife upload roles/
$ (./bin/)knife upload cookbooks/
```


## Stack Sample

- `stacks/hadoop-hdfs-cdh.json`: creates hadoop hdfs cluster [name x1 data x3]
    - all nodes will be registered to `Mackerel.io`.

## Create stack and regist nodes and clients to chef-server.

```
$ (./bin/)knife cs stack create stacks/hadoop-hdfs-cdh.json 
```


## Delete stack and remove nodes and clients from chef-server.

```
$ (./bin/)knife cs stack delete stacks/hadoop-hdfs-cdh.json 
$ (./bin/)knife node bulk delete node
$ (./bin/)knife client bulk delete node
```

