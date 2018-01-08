Jenkins on Vagrant via Ubuntu 16.04.2 LTS on Hyper-V (Windows 10 64 Pro).  

Spin up a development ready Jenkins instance on Ubuntu 16.04.1 using Vagrant, Hyper-V and Ansible.   The Jenkins instance will be configured with many commonly used
development tools to include Java, NodeJS, .NetCore, and Python.   It is also configured with Docker, Terraform and Kubernetes management tools kops and kubectl.   

Note:  I currently use Bash on Ubuntu on Windows for my workstation Linux.  Ubuntu on Windows is available for Windows 10 and is where I have Ansible installed.  Windows 10 64 Pro comes with Hyper-V for virtualization.   I've abandoned VirtualBox in favor of Hyper-V as Hyper-V comes installed and configured with Windows 10 64 Pro.



1.  Install and configure Vagrant.  See HashiCorps site for installation instructions:  https://www.vagrantup.com/docs/installation/

2.  Add the hyper-v Vagrant ubuntu box.   command: vagrant box add kmm/ubuntu-xenial64.     You can find more hyperv boxes here:  https://app.vagrantup.com/boxes/search?provider=hyperv.   current kmm/ubuntu-xenial64 is set to use Ubuntu 16.04.2

3.  Setup Virtual Switch.  Using Hyper-V Manager setup a Virtual Switch (perhaps name it VagrantSwitch) with the following connection type settings.
       External Network
       Ethernet Connection
       Allow Management OS to share this adapter = Yes

4.  Setup Windows User.  Setup a windows user to be used for Vagrant

5.  Run vagrant up --provider=hyperv

6.  Select your newly created Vagrant Switch and enter your newly created Windows User/PW when prompted.  

7.  Once complete a private key will be generated in .vagrant/machines/default/hyperv.  Copy that private key, chmod 600 and add it to your ssh agent. 

8.  Get IP address of newly created Vagrant host.   You can acquire this via vagrant ssh ifconfig or via the Hyper-V Manager GUI.

9.  edit your ansible /etc/ansible/hosts file with an entry similar to
    [vagrant]
    <your vagrant box ip address>

10.  Now, run ansible playbook <pathtoplaybook>/jenkins-ubuntu-fresh/jenkins-ubunty.yml --user vagrant --become --verbose

11.  Upon completion your Vagrant box should be configured with Jenkins running behind Nginx.   In a browser Navigate to <your vagrant box ip address> and you should be presented with the Jenkins Admin setup screen. 



Enjoy!







