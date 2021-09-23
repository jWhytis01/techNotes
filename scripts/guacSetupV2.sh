# setup desktop user as sudo
# login as user to do install

# Following this articale for install
# https://www.linuxbabe.com/ubuntu/apache-guacamole-remote-desktop-ubuntu-20-04
# https://techexpert.tips/apache/enable-https-apache/

# install dependencies for guacamole!
sudo apt update
sudo apt install build-essential libcairo2-dev libjpeg-turbo8-dev libpng-dev libtool-bin libossp-uuid-dev libvncserver-dev freerdp2-dev libssh2-1-dev libtelnet-dev libwebsockets-dev libpulse-dev libvorbis-dev libwebp-dev libssl-dev libpango1.0-dev libswscale-dev libavcodec-dev libavutil-dev libavformat-dev

# other article says do jdk so...
sudo apt install openjdk-11-jdk

# Borrowing from another install doc to get the server
# be sure to check current version!
wget https://downloads.apache.org/guacamole/1.3.0/source/guacamole-server-1.3.0.tar.gz -P ~
tar -xvf guacamole-server-1.3.0.tar.gz
cd guacamole-server-1.3.0
./configure --with-init-dir=/etc/init.d
sudo make
sudo make install
sudo ldconfig

# what does this command do? ldconfig?
sudo systemctl daemon-reload
sudo systemctl start guacd
sudo systemctl enable guacd

# I like that command
systemctl status guacd  

# use ss -lpt to find open port
sudo ss -lpt | grep guacd

# Install Tomcat webserver
sudo apt install tomcat9 tomcat9-admin tomcat9-common tomcat9-user

# Install the webapp for tomcat
wget https://downloads.apache.org/guacamole/1.3.0/binary/guacamole-1.3.0.war -P ~
sudo mkdir /etc/guacamole
sudo mv ~/guacamole-1.3.0.war /etc/guacamole/guacamole.war
  
# using other set of instructions - linking files instead of moving them
sudo ln -s /etc/guacamole/guacamole.war /opt/tomcat/tomcatapp/webapps
sudo ln -s /etc/guacamole/guacamole.war /var/lib/tomcat9/webapps/guacamole.war
sudo systemctl restart tomcat9 guacd
sudo ss -lnpt

################################
# Configure Guacamole
sudo mkdir /etc/guacamole/
# dir already exists
sudo nano /etc/guacamole/guacamole.properties

# !#! !#! !#! !#! !#! !#! !#! !#! !#! 
# Change password in next line
# !#! !#! !#! !#! !#! !#! !#! !#! !#! 

echo -n xxxxxxx | openssl md5
sudo nano /etc/guacamole/user-mapping.xml

# Install xwindows
sudo apt upgrade
sudo apt update
sudo apt install xfce4 xfce4-goodies libreoffice

sudo apt install tigervnc-standalone-server
tigervncserver -xstartup /usr/bin/xterm
# check desktop session
less xstartup 
nano xstartup
# https://stackoverflow.com/questions/59709214/tigervncserver-crashes-unless-started-with-sudo
sudo nano /etc/systemd/system/vncserver@.service
sudo systemctl start vncserver@1.service
vncserver -kill :1
sudo systemctl start vncserver@1.service
# password issue
# https://superuser.com/questions/901727/getpassword-error-inappropriate-ioctl-for-device-vnc-error
sudo systemctl daemon-reload

# Multiple users
# https://askubuntu.com/questions/581979/ubuntu-14-10-multiple-simultaneous-independent-remote-desktop-like-connection
# other config info
# https://bbs.archlinux.org/viewtopic.php?id=260318

sudo systemctl enable vncserver@1.service
sudo systemctl status vncserver@1.service
sudo systemctl daemon-reload
# tomcat logs?
tail catalina.2021-08-15.log
less localhost_access_log.2021-08-15.txt
nano /etc/guacamole/user-mapping.xml

#
sudo apt install apache2
sudo a2enmod proxy proxy_http headers proxy_wstunnel
sudo nano /etc/apache2/sites-available/guacamole.conf
sudo apachectl -t
# Command checks validity of config files
sudo a2ensite guacamole.conf
sudo systemctl restart apache2
sudo systemctl daemon-reload
xtigervncviewer -SecurityTypes VncAuth -passwd /home/admin_jason/.vnc/passwd :2
# This is a cool trick to find commands
# history | grep kill

#certbot is a cool little service.  Should go on our donate to list.
sudo certbot --apache --agree-tos --redirect --hsts --staple-ocsp --email jason@nobullbarbeque.com -d guacamole.nobullbarbeque.com -d www.nobullbarbeque.com
# https://techexpert.tips/apache/enable-https-apache/


sudo nano ~/.vnc/xstartup
sudo nano /etc/systemd/system/vncserver@.service
vncserver -kill :1
sudo systemctl start vncserver@1.service
sudo systemctl enable vncserver@1.service
sudo systemctl status vncserver@1.service
sudo ss -lnpt
history >> installHistory
sudo ss -lnpt >> installHistory

# begin Apache Installation
sudo apt install apache2
sudo a2enmod proxy proxy_http headers proxy_wstunnel
sudo nano /etc/apache2/sites-available/guacamole.conf
sudo /home/admin_jason/Installs/Scripts/checkGuac.sh 
sudo certbot --apache --agree-tos --redirect --hsts --staple-ocsp --email jason@nobullbarbeque.com -d guacamole.nobullbarbeque.com -d www.nobullbarbeque.com
nano /etc/apache2/sites-enabled/guacamole.conf 

less /etc/apache2/
less /etc/apache2/sites-available/guacamole.conf
sudo echo "" > /etc/apache2/sites-available/guacamole.conf
sudo nano /etc/apache2/sites-available/guacamole.conf
sudo echo "" > /etc/apache2/sites-available/guacamole.conf
sudo nano /etc/apache2/sites-available/guacamole.conf
sudo apachectl -t
sudo nano /etc/apache2/sites-available/guacamole.conf
sudo nano openssl
sudo apt-install openssl
sudo apt-get install openssl
sudo a2enmod ssl
sudo a2enmod rewrite
sudo systemctl restart apache2
sudo nano /etc/apache2/apache2.conf
sudo nano /etc/apache2/sites-available/guacamole.conf
sudo apachectl -t
sudo nano /etc/apache2/sites-available/guacamole.conf
sudo apachectl -t
sudo servicectl apache2 restart


# Security Stack:
# 
# LAN/WAN Implementation
# ----------------------------------------------
# 	Node: Linux
# 		systemD
# 		User
# 			xWindows
# 			tigervnc
# ----------------------------------------------	
# 	Node: Linux - can be the same as above
# 		Gucamole Server
# 		Tomcat
# 			Gucamole Client - all you need but
# 		apache2
# 			Certificate
# 
# Internet
# ----------------------------------------------
# 	Node: OS - any flavor
# 		Browser - all you need but...
# 			SSL Commection
# 
# Components
# 	TigerVNC
# 		vncconfig
# 		vncpasswd
# 		vncsession
# 		vncviewer
# 		x0vncserver
# 		Xvnc
# 
# Links
# https://tigervnc.org/
