Intallation
------------

```
wget https://packages.chef.io/files/stable/chef/12.16.42/mac_os_x/10.11/chef-12.16.42-1.dmg
```

Configure a resource/config
-----------------------------

```bash
mkdir streaming-chef-example
cd streaming-chef-example/
```

Then create a ruby CHEF script to configure a file at `/etc`, make sure `/etc` has permission 
to write otherwise need to run chef-client as sudo.

```ruby
  1 file '/etc/streaming.conf' do                          
  2           content 'environment=staging'                                                           
  3 end     
```

Finally, I configure the file at `/etc/streaming.conf` from ruby script, which is a CHEF in the JEEKS kitchen, 5th ave, 
managing things around.

```bash
chef-client --local-mode configure_a_file_from_kitchen.rb 
Password:
[2016-12-07T23:55:17-08:00] WARN: No config file found or specified on command line, using command line options.
[2016-12-07T23:55:17-08:00] WARN: No cookbooks directory found at or above current directory.  Assuming /Users/as18/possibilities/programming/s2/streaming-chef-example.
Starting Chef Client, version 12.16.42
/opt/chefdk/embedded/lib/ruby/gems/2.3.0/gems/chef-12.16.42/lib/chef/mixin/path_sanity.rb:25: warning: Insecure world writable dir /usr/local/scala-2.11.8 in PATH, mode 040777
[2016-12-07T23:55:18-08:00] WARN: [inet] no ip address on utun0
[2016-12-07T23:55:18-08:00] WARN: unable to detect ipaddress
resolving cookbooks for run list: []
Synchronizing Cookbooks:
Installing Cookbook Gems:
Compiling Cookbooks...
[2016-12-07T23:55:21-08:00] WARN: Node M00974000.nordstrom.net has an empty run list.
Converging 1 resources
Recipe: @recipe_files::/Users/as18/possibilities/programming/s2/streaming-chef-example/configure_a_file_from_kitchen.rb
  * file[/etc/streaming_conf] action create
    - create new file /etc/streaming.conf
    - update content in file /etc/streaming.conf from none to ae5ce1
    --- /etc/streaming_conf	2016-12-07 23:55:21.000000000 -0800
    +++ /etc/.chef-streaming_conf20161207-35041-1ya2j9j	2016-12-07 23:55:21.000000000 -0800
    @@ -1 +1,2 @@
    +environment=staging

Running handlers:
Running handlers complete
Chef Client finished, 1/1 resources updated in 03 seconds
```

Now, I can see the conf file at `/etc`, 

```bash
$ cat /etc/streaming.conf 
environment=staging
```
