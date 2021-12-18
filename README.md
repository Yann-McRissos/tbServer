# Twinbridge Server
### Only works with mariadb-server 10.1 (a Docker container works too)

## Requirements
- a mariadb 10.1 database 
- a wordpress database
- ip_forward must be set to 1 on the machine: 
	\# sysctl -w net.ipv4.ip_forward=1

### Installation instructions
Clone the repository on your system:
 	git clone https://github.com/Yann-McRissos/tbServer.git

Start the install.sh script at installer/install.sh **with root privileges !**

/!\ Note the databases' usernames and passwords at the end of the installation procedure /!\\

	# bash tbServer/installer/install.sh
  
/!\ Note the databases' usernames and passwords at the end of the installation procedure /!\\

The installation scripts also creates a new certificate and CA key for the server.

When the script is done, make a copy of /etc/tbServer/bin/includes/config.json.example and remove the .example

	# cp config.json.example config.json
  
Update the new file with the database credentials you received at the end of the installation script.
- DB credentials for the twinbridge database
- DB credentials for the WordPress database
- SMTP credentials for the email account

On the wordpress database, run the script located at scripts/wordpress.sql, this will create the wp_twinings table necessary to run the server.

	MariaDB [wordpress]> source /path/to/wordpress.sql

Finally, over on the client machines: update the client's ovpn config file (client.ovpn).
It must contain the newly generated CA.key and server certificate (located in /etc/openvpn/ on the server).

### Usage
The database can be filled with test users by running the python script at testing/createTestUsers.py

	# python3 createTestUsers.py
	
Make sure the services are running:
	
	# systemctl status twinbridge
	
There are 5 total services: twinbridge, twinbridge-labManager, twinbridge-labCleaner, twinbridge-labAnalyzer, ...
Use double tabs to autocomplete.
