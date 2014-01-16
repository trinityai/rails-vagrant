# Ruby/Rails Dev Environment

Here's a first crack at using chef and vagrant

You'll need:

 - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (but not version 4.2.14, because there's a regression)

 - The latest version of [Vagrant](http://downloads.vagrantup.com/)

Then clone this repository:

    git clone https://github.com/trinityai/rails-vagrant.git

Checkout the cookbooks (which are submodules) with the following commands

    git submodule init
    git submodule update

Then create the virtual machine:

    cd rails-vagrant

    vagrant up

It'll take a while ~10 minutes to download everything it needs and set up.
Then do

    vagrant ssh

and you'll be inside the VM

## Optional (To deploy to servers and such) ##

If you have rvm installed, the .ruby-version and .ruby-gemset files in this directory will create a gemset for you

    gem install bundler

    bundle install

will install chef and knife

    knife solo prepare username@host

or

    knife solo prepare -i ssh_key.pem username@host

will install chef on the remote host (assuming you have key access)

this will also create an entry in the nodes/ folder, you can just copy the contents of nodes/vagrant.json for now
I think the reason there are separate files for each server is if you had different roles ie database, web, load balancer

    cat nodes/vagrant.json > nodes/username@host

then do

    knife solo cook username@host

and this will configure the remote host

## TODO ##

you can define recipes in site-cookbooks/ that are project specific, so setup something to get rails running

you'll want to have a default recipe that does production, and a recipe[project::vagrant] to run it out of the /vagrant shared directory for the vm

