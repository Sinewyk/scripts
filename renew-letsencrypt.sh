#!/bin/sh

cd /opt/letsencrypt/
./certbot-auto --config /etc/letsencrypt/configs/sinewyk.com.conf certonly

if [ $? -ne 0 ]
	then
		ERRORLOG=`tail /var/log/letsencrypt/letsencrypt.log`
		echo -e "The Let's Encrypt cert has not been renewed! \n \n" \
		$ERRORLOG
	else
		nginx -s reload
	fi
exit 0
