Vagrant.configure("2") do |config|
  config.vm.box = 'ovirt4'
  config.vm.hostname = "<< fqdn >>"
  ssh_pub_key = File.readlines("/root/.ssh/id_rsa.pub").first.strip
  config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
  config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
  config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false

  config.vm.network :private_network,
    #:ovirt__network_name => 'ovirtmgmt' #DHCP
    # Static configuration
    :ovirt__ip => '192.168.10.102', :ovirt__network_name => 'ovirtmgmt', :ovirt__gateway => '192.168.10.254', :ovirt__netmask => '255.255.255.0', :ovirt__dns_servers => '192.168.10.1', :ovirt__dns_search => '<< domain >>'

  config.vm.provider :ovirt4 do |ovirt|
    ovirt.url = 'https://ovirt-engine/ovirt-engine/api'
    ovirt.username = "admin@internal"
    ovirt.password = "<< password >>"
    ovirt.insecure = true
    ovirt.debug = true
    ovirt.cluster = '<< Cluster name >>'
    ovirt.template = 'CentOS_7.6_Tmpl_Vagrant'
    ovirt.console = 'spice'
    ovirt.memory_size = '8 GiB' #see https://github.com/dominikh/filesize for usage
    ovirt.memory_guaranteed = '8192 MB' #see https://github.com/dominikh/filesize for usage
    ovirt.cpu_cores = 2
    ovirt.cpu_sockets = 2
    ovirt.cpu_threads = 1
  end

#  config.vm.provision "ansible" do |ansible|
#    ansible.verbose = "v"
#    ansible.playbook = "site.yml"
#    ansible.compatibility_mode = "2.0"
#  end
end
