# Twinbridge Server

### Only works on Ubuntu 18.04 with mariadb-server 10.1

### Installation instructions
Clone the repository on your system.

Start the install.sh script **with root privileges !**

\# bash tbServer/installer/install.sh

### To do after install:

/!\ Note the databases' usernames and passwords at the end of the installation procedure /!\\
  
Make a copy of /etc/tbServer/bin/includes/config.json.example and remove the .example
Update the new file with the database credentials you received at the end of the installation script.
  +DB credentials for twinbridge database
  +DB credentials for WordPress database
  +SMTP credentials for email account


Over on the client machines: update the client's ovpn config file (client.ovpn).
It must contain the newly generated CA key and server certificate (located in /etc/openvpn/ on the server).
