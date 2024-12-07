Assignment 12: Configuration as Code (CaC)
Configuration as Code (CaC) Using Puppet
This repository contains files and scripts for Assignment 12, which involves automating server configurations using Puppet. The assignment demonstrates how to create and manage a LAMP stack environment and user accounts on cloned Ubuntu virtual machines using Puppet manifests.

Hardware and Software Requirements
Hardware
Host Computer (Linux, macOS, or Windows)
Virtual Machine Environment: VirtualBox or VMware
Ubuntu 24.04 Server
Software
Puppet Agent (Version 8.x)
VirtualBox (or any other supported hypervisor)
SSH Client (e.g., OpenSSH, PuTTY)
Git for source control
Assignment Overview
The goal of this assignment is to explore Configuration as Code (CaC) using Puppet to automate server configurations for LAMP stacks and user management. Key steps include:

Creating a template virtual machine.
Cloning the template VM.
Managing users using Puppet manifests.
Deploying and configuring a LAMP stack using Puppet.
Steps to Complete the Assignment
Part 1: Create a Template Virtual Machine
Create a Fresh Ubuntu VM

Set up a new Ubuntu 24.04 server in VirtualBox with the following configuration:
2 GB RAM
2 CPUs
NAT and Host-Only Adapters
Install Puppet

Update the package repositories and upgrade the system:
  
   
sudo apt update && sudo apt upgrade
Install Puppet:
  
   
sudo apt install puppet
Verify installation:
  
   
puppet --version
Test Puppet

Create and test a Puppet manifest file to ensure Puppet is installed and working.
Part 2: Clone the Template VM
Clone the Template VM

Use the VirtualBox GUI to create a linked clone of the template VM.
Ensure the new clone has a unique IP address.
Verify the Cloned VM

Start the clone and confirm it is operational.
Part 3: Manage Users Using Puppet
Create a Puppet Manifest File

Create a server_users_groups.pp file in a puppet-dev directory to define users and groups:
puppet
   
group { 'group01':
  ensure => present,
}

group { 'group02':
  ensure => present,
}

user { 'user04':
  ensure     => present,
  shell      => '/bin/  ',
  password   => '<hashed_password>',
  groups     => ['group01'],
  managehome => true,
}
Apply the Manifest

Run the following command to apply the manifest:
  
   
sudo puppet apply server_users_groups.pp
Verify User and Group Creation

Confirm the users and groups were successfully created:
  
   
cat /etc/passwd
cat /etc/group
Part 4: Configure a LAMP Stack Using Puppet
Create a Puppet Manifest for LAMP Stack

Create a lamp_stack_server.pp file:
puppet
   
package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure  => installed,
  require => Package['apache2'],
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']],
}
Test the LAMP Stack

Apply the manifest:
  
   
sudo puppet apply lamp_stack_server.pp
Open a browser and navigate to the VM's IP address to confirm Apache is running.
Add PHP Support

Update the manifest to include the php-mysql package.
Test PHP

Add a phpinfo.php file in /var/www/html:
php
   
<?php
phpinfo();
?>
Confirm PHP is working by visiting:
arduino
   
http://<ip_address>/phpinfo.php
(Optional) Add MariaDB

Add MariaDB as part of the LAMP stack configuration:
puppet
   
package { 'mariadb-server':
  ensure => installed,
}

service { 'mariadb':
  ensure => running,
  enable => true,
  require => Package['mariadb-server'],
}
How to Run
Clone the Repository

  
   
git clone <repository_url>
cd <repository_name>
Set Up the Puppet Environment

Install Puppet if not already installed:
  
   
sudo apt install puppet
Apply Puppet Manifests

Navigate to the manifest directory:
  
   
cd puppet-dev
Run the manifests:
  
   
sudo puppet apply server_users_groups.pp
sudo puppet apply lamp_stack_server.pp
Verify Results

Check for user and group creation in /etc/passwd and /etc/group.
Access the LAMP stack by navigating to the VM's IP address.
File Structure
puppet-dev/
server_users_groups.pp: Manages user and group creation.
lamp_stack_server.pp: Automates LAMP stack installation.
Notes
Make sure to use unique IP addresses for cloned VMs.
Keep Puppet manifests updated for consistency across servers.
Use a GitHub repository for version control and collaboration.
