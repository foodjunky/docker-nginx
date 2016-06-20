#
# NGINX web server
#
# docker-build properties:
# TAG=foodjunky/nginx:latest

FROM foodjunky/base
MAINTAINER Jeremy Jongsma "jeremy@foodjunky.com"

# Install Nginx.
RUN add-apt-repository -y ppa:nginx/stable && \
	apt-get update && \
	apt-get install -y nginx && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	chown -R www-data:www-data /var/lib/nginx

ADD nginx/ /etc/nginx/

# Define mountable directories.
VOLUME ["/var/www"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 8080

# Define default command.
CMD ["/usr/sbin/nginx"]
