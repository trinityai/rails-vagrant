#
# Cookbook Name:: chef-trinity
# Recipe:: default
#
# Copyright 2013, Patrick Anderson
#

chef_gem "ruby-shadow"

user "triadmin" do
	home     "/home/triadmin/"
	comment  "Trinity Default User"
	password "$1$WPwJWy5s$r/.tTAvvujnwvC8KvfB5L1"
	shell    "/bin/bash"
	supports :manage_home => true
	action   :create
end

user "root" do
  password "$1$t4ps2bbf$uruvGiaRFAXdc.w4XW1AC1"
  action   :modify
end

simple_iptables_policy "INPUT" do
  policy "DROP"
end

simple_iptables_policy "FORWARD" do
  policy "DROP"
end

simple_iptables_policy "OUTPUT" do
  policy "ACCEPT"
end

simple_iptables_rule "system" do
  rule "-m conntrack --ctstate ESTABLISHED,RELATED"
  jump "ACCEPT"
end

simple_iptables_rule "system" do
  rule "-m conntrack --ctstate INVALID"
  jump "DROP"	
end

simple_iptables_rule "system" do
  rule "-i lo"
  jump "ACCEPT"	
end

simple_iptables_rule "system" do
  rule "-p tcp -m multiport --dports 22,80"
  jump "ACCEPT"	
end

simple_iptables_rule "system" do
  rule "-p icmp"
  jump "ACCEPT"	
end
