Vagrant.require_version ">= 1.9.6"
Vagrant.configure(2) do |config|

    # Base box
    config.vm.define "ubuntu-elk" do |ubuntu|

        ubuntu.vm.box = "ubuntu/bionic64"

        ubuntu.vm.hostname = "elastick-stack"

        ubuntu.vm.network :forwarded_port, guest: 9200, host: 9200

        ubuntu.vm.network :forwarded_port, guest: 5601, host: 5601
        # If you export the box switch to the second line to keep the /elastic-stack/ folder
        ubuntu.vm.synced_folder "elastic-stack/", "/elastic-stack/"
        #ubuntu.vm.synced_folder "elastic-stack/", "/elastic-stack/", type: "rsync" 
    end

    # Configure the VirtualBox parameters
    config.vm.provider "virtualbox" do |vb|

        vb.name = "elastick-stack"
        vb.customize [ "modifyvm", :id, "--memory", "2048" ]
    end

    # Install Elasticsearch
    config.vm.provision "shell", path: "scripts/install-elastic.sh"
    config.vm.provision "shell", path: "scripts/install-kibana.sh"

    # Start Services: run this on every vagrant up
    config.vm.provision :shell, path: "scripts/start-services.sh", run: 'always'


end