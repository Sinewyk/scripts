#!/bin/sh

cd /opt/letsencrypt/
sudo ./certbot-auto renew

if [ $? -ne 0 ]
	then
		ERRORLOG=`tail /var/log/letsencrypt/letsencrypt.log`
		echo -e "The Let's Encrypt cert has not been renewed! \n \n" \
		$ERRORLOG
	else
		sudo service nginx reload
	fi
exit 0
