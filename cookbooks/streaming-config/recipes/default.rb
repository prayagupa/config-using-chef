#
# Cookbook Name:: streaming-config
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

template '/etc/streaming.conf' do
  source 'streaming.conf.erb'
  variables({
	:env => 'prod' 
  })
end 
