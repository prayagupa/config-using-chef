
Create a `cookbook` for `streaming-config`

```
knife cookbook create streaming-config -o cookbooks
```

```
ll cookbooks/streaming-config/
total 12
drwxrwx--- 1 root vboxsf  442 Dec  8 01:30 ./
drwxrwx--- 1 root vboxsf  102 Dec  8 01:30 ../
drwxrwx--- 1 root vboxsf   68 Dec  8 01:30 attributes/
-rwxrwx--- 1 root vboxsf  463 Dec  8 01:30 CHANGELOG.md*
drwxrwx--- 1 root vboxsf   68 Dec  8 01:30 definitions/
drwxrwx--- 1 root vboxsf  102 Dec  8 01:30 files/
drwxrwx--- 1 root vboxsf   68 Dec  8 01:30 libraries/
-rwxrwx--- 1 root vboxsf  296 Dec  8 01:30 metadata.rb*
drwxrwx--- 1 root vboxsf   68 Dec  8 01:30 providers/
-rwxrwx--- 1 root vboxsf 1525 Dec  8 01:30 README.md*
drwxrwx--- 1 root vboxsf  102 Dec  8 01:30 recipes/
drwxrwx--- 1 root vboxsf   68 Dec  8 01:30 resources/
drwxrwx--- 1 root vboxsf  102 Dec  8 01:30 templates/

```
create a config template, which can be created based on staging or prod environment

```
$ chef generate template cookbooks/streaming-config streaming.conf
Recipe: code_generator::template
  * directory[cookbooks/streaming-config/templates/default] action create
    - create new directory cookbooks/streaming-config/templates/default
  * template[cookbooks/streaming-config/templates/streaming.conf.erb] action create
    - create new file cookbooks/streaming-config/templates/streaming.conf.erb
    - update content in file cookbooks/streaming-config/templates/streaming.conf.erb from none to e3b0c4
    (diff output suppressed by config)
```
add config template to `streaming.conf.erb`

```
pipeline.source=<%= node[:streaming][:sources] %>
pipeline.channel=<%= node[:streaming[:channels] %>
pipeline.sink=<%= node[:streaming][:sinks]%>
```

Then, I will use that config template in my CHEF recipe file.(`recipe/default.rb`)

```
template '/etc/streaming.conf' do
  source 'streaming.conf.erb'
end
```

Then, att attributes to be used by the template

```
  1 default['streaming']['sources']= 'source_1'                                                                                                    2 default['streaming']['channels']= 'channel_1'                                                       
  3 default['streaming']['sinks']= 'sink_1'
```


Finally, I will run the default.rb recipe,

```
sudo chef-client --local-mode --runlist 'recipe[streaming-config]'
```

DONE !!! COOKED !!! 
See config at `/etc/streaming.conf`

