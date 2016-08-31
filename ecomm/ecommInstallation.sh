#!/bin/bash


##### Prerequisites for running this script #####

#1.	Script only runs on CentOS [RPM based systems].
#2.	Mysql-Server should already be installed and running.

ROOTPW=""



if 		! which php > /dev/null; then
	

		sleep 2
		yum clean all
		yum install php55-php
		yum install php55-php-mysql
		yum install php55-php-pecl-xdebug

		head -n3 /opt/rh/php55/enable>>.bash_profile

		printf "\n\n\t"

		sleep 2



else

	echo "php is installed"
	printf "\n\n\t"
	sleep 2
fi

	

####################3 Mysql installation########






if 		! which mysql>/dev/null; then
		echo -e "kpmecl"
		sleep 2
		printf "\n\n\t"

	


	   	if 	[ $# -eq 0 ]; then
			 echo "No arguments supplied... Using default MySQL Root Password..."
     			yum -y install mysql-server
    			 service mysqld start
			 mysql -u root -p $ROOTPW
    			 printf "\n\n"
	
    		 sleep 3
    		 	printf "\n\n"

    
			 mysql -u root -p$ROOTPW 
   
  		 else 

     	echo "Arguments Supplied... Using provided MySQL Password..."
	 	yum -y install mysql-server
    		 service mysqld start
		 mysql -u root -p $2
		

	 mysql -u root -p$2 
   fi

else
   echo "MySQL is installed."
   sleep 3
   printf "\n\n"
   if [ $# -eq 0 ]; then
     echo "MySQL Password not supplied... Using default MySQL Password..."
     sleep 3
     printf "\n\n"  
     service mysqld start
     mysql -u root -p$ROOTPW 
	
   else
	 echo "MySQL Password Supplied... Using Supplied MySQL Password to create database..." 
     service mysqld start
     mysql -u root -p$2 
   fi 
fi









































