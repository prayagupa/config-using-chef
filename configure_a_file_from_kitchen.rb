
#directory '/etc/streaming-pipeline' do
#  owner 'admin'
#  group 'admin'
#  mode '0755'
#  action :create
#end

remote_file 'filebeat-5.0.2-darwin-x86_64.tar.gz' do
  source 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.2-darwin-x86_64.tar.gz'
end

tarball 'filebeat-5.0.2-darwin-x86_64.tar.gz' do
   destination '/etc/streaming-pipeline'
   owner 'root'
   group 'root'
   extract_list [ '*.conf' ]
   umask 002
   action :extract
end

file '/etc/streaming.conf' do
  content 'environment=staging'
end
