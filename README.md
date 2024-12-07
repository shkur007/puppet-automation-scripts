Assignment 12: Configuration as Code (CaC)
This repository contains Puppet manifest files and related artifacts for automating IT infrastructure configuration. The assignment focuses on using Puppet to create, configure, and manage servers in a consistent, repeatable, and efficient manner.

Overview
This project demonstrates how to:

Create a new Ubuntu 24.04 server and install Puppet.
Clone the initial server to use as a base template for further configurations.
Use Puppet to automate user creation and management.
Use Puppet to automate the setup of a LAMP stack environment.
Repository Structure
manifests/:
server_users_groups.pp: Puppet manifest for managing users and groups.
lamp_stack_server.pp: Puppet manifest for setting up a LAMP stack.
files/:
phpinfo.php: PHP test file used to verify PHP installation.
docs/:
Detailed instructions and screenshots of the steps performed.
README.md: This documentation file.
Steps Completed
Part 1: Create a New VM and Install Puppet
Created a new Ubuntu 24.04 virtual machine with:
2GB RAM, 1-2 CPUs, and 25GB storage.
NAT and Host-Only adapters for networking.
Installed Puppet on the VM:
  
  
sudo apt install puppet
Verified Puppet installation by creating and applying a simple manifest to generate a file (/tmp/hello.txt).
Part 2: Clone the Puppet VM
Cloned the base VM to create a new VM using VirtualBox’s Linked Clone feature.
Ensured the cloned VM received a unique IP address by modifying its /etc/machine-id.
Part 3: Use Puppet to Add Users
Created a Puppet manifest (server_users_groups.pp) to:
Define and manage users (user04, user05, user06, and user07).
Configure group memberships (group01 and group02).
Assign hashed passwords using SHA-512 hashing.
Set up user home directories and default login shells.
Applied the manifest to automate user creation and verified the results by logging in as the users.
Part 4: Use Puppet to Implement a LAMP Stack
Created a Puppet manifest (lamp_stack_server.pp) to automate:
Installation of Apache, PHP, and required modules (php-mysql).
Configuration of the Apache service to run and enable on startup.
Added a PHP file (phpinfo.php) to test PHP integration with Apache.
Verified LAMP stack functionality by:
Accessing the default Apache page.
Navigating to the PHP info page (/phpinfo.php).
Technologies Used
Ubuntu 24.04: Operating system for the virtual machines.
VirtualBox: Hypervisor for creating and cloning virtual machines.
Puppet: Configuration management tool for automating server setup.
Apache2: Web server for hosting applications.
PHP: Server-side scripting language.
MariaDB: MySQL-compatible database server.
How to Use
Clone the Repository
Clone this repository onto your local system or server:
  
  
git clone https://github.com/your-username/assignment12-cac
cd assignment12-cac
Apply Puppet Manifests
Copy the manifest files to the Puppet directory on the server (e.g., /home/user/puppet-dev/).
Apply the manifests:
For user management:
  
  
sudo puppet apply manifests/server_users_groups.pp
For the LAMP stack:
  
  
sudo puppet apply manifests/lamp_stack_server.pp
Verify Configurations
Test user logins for user04, user05, user06, and user07.
Navigate to the server’s IP address to check:
Default Apache page.
PHP test page at /phpinfo.php.
Submission Items
Screenshots of:
/tmp/hello.txt creation and content (Part 1).
Cloned VM and VirtualBox GUI showing linked base (Part 2).
Output of /etc/passwd and /etc/group showing user and group creation (Part 3).
Default Apache page and PHP test page (Part 4).
Links to the GitHub repository with properly formatted Puppet manifests.
Advantages and Disadvantages of Automation Approaches
Pre-Configured Templates
Advantages:

Quicker deployment since all software is pre-installed.
Consistent environments without relying on external scripts.
Fewer external dependencies during setup.
Disadvantages:

Requires maintenance to keep templates updated.
Disk space usage increases with multiple templates.
Not as flexible for diverse configurations.
Puppet Automation
Advantages:

Highly flexible and adaptable to different environments.
Centralized management of configurations as code.
Version control for configuration changes.
Disadvantages:

Initial setup takes time and effort.
Requires expertise to create and troubleshoot manifests.
Relies on software installation during runtime.
