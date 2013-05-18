# -*- mode: ruby -*-
# vi: set ft=ruby : 
require 'rubygems'
require 'json'

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://trinity-ai.com/vagrantboxes/precise64.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  VAGRANT_JSON = JSON::parse(
    Pathname(__FILE__).dirname.join('nodes', 'vagrant.json').read
  )

  VAGRANT_JSON['run_list'] << "recipe[rvm::vagrant]"
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    chef.roles_path = "roles"
    chef.data_bags_path = "data_bags"
    chef.provisioning_path = "/tmp/vagrant-chef"

    chef.json = VAGRANT_JSON
    VAGRANT_JSON['run_list'].each do |recipe|
      chef.add_recipe(recipe)
    end if VAGRANT_JSON['run_list']
  end
end

