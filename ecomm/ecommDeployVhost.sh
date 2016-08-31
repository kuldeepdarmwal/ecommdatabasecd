#!/bin/bash
####################### Unzip File into specified directory#########################


cd /opt/rh/httpd24/root/var/www/html/


sudo cp -r /var/lib/jenkins/jobs/GK_Php_Dupl/workspace/ecomm_project.zip  /opt/rh/httpd24/root/var/www/html 

sudo unzip -do ecommercecd ecomm_project.zip



sudo chmod -R 777 ecommercecd

sudo echo  "127.0.0.1 ecommercecd">>sudo /etc/hosts
echo "Creating VHOST file "
sudo echo '<VirtualHost *:80>
    <Directory "/opt/rh/httpd24/root/var/www/html/ecommercecd">
        Options Indexes FollowSymLinks Includes ExecCGI
        Order allow,deny
        Allow from all
    </Directory>
    <IfModule mod_php5.c>
        php_admin_flag safe_mode Off
        php_admin_value register_globals 0
        php_value magic_quotes_gpc 0
        php_value magic_quotes_runtime 0
        php_value allow_call_time_pass_reference 0
    </IfModule>
    DirectoryIndex index.php
    DocumentRoot "/opt/rh/httpd24/root/var/www/html/ecommercecd"
    ServerName ecommercecd
</VirtualHost>' >>/opt/rh/httpd24/root/etc/httpd/conf.d/ecommercecd.conf


sudo service httpd24-httpd restart

#sudo firefox -new-window ecommercecd
#echo "Hurrah! Got success"
#cd /opt/rh/httpd24/root/etc/httpd/conf.d/
#rm -rf ecommerce-cd.conf

