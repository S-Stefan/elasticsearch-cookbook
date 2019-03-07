#
# Cookbook:: elasticsearch
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Update Source List
apt_update "update" do
  action :update
end

# Install java runtime environment.
package "openjdk-8-jdk" do
  action :install
end

# Install transport-https
package 'apt-transport-https' do
   action :install
 end

 # Add elasticsearch key
 bash "add-key" do
   code "wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -"
   action :run
 end

# Get elasticsearch
 apt_repository "elasticsearch" do
   uri "https://artifacts.elastic.co/packages/5.x/apt"
   action :add
 end

 # Update Source List
 apt_update "update" do
   action :update
 end

 # Install elasticsearch
package "elasticsearch" do
  action :install
end

# Replace config File
file("/etc/elasticsearch/elasticsearch.yml") do
  action :delete
end

template("/etc/elasticsearch/elasticsearch.yml") do
  source "elasticsearch.yml.erb"
end

# Start elasticsearch
service "elasticsearch" do
  action [:enable, :start]
end
