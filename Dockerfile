FROM php:7.4-apache

#Downloading PHP 7.4 from the Official Docker Regsitry
#Note: It is recommended to upload this php image to your own private ECR repo, to avoid hitting docker rate limit


RUN apt-get update && apt upgrade -y
#Updating the package lists for upgrades and downloading the latest packages

COPY docker-php.conf /etc/apache2/conf-available/docker-php.conf
#Copying our custom docker-php.conf file to the image,
#The custom conf file makes the login.php or any file that you want as the default page when the application starts.




ADD . /var/www/html
#Copying the Code from current location to /var/www/html 


RUN a2enmod rewrite &&\
    service apache2 restart

EXPOSE 80
#Exposing Port 80 

CMD ["apachectl", "-D", "FOREGROUND"]
#Default command to run when the container starts...
