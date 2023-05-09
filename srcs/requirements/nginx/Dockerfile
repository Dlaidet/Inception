FROM	debian:buster

#Installation command
RUN	apt update && apt install -y nginx
RUN	apt update && apt install -y openssl

#Move Nginx config file
COPY conf/nginx.conf /etc/nginx/conf.d

#Create SSL directory
RUN mkdir -p /etc/nginx/ssl

#Command create certificate
RUN openssl req -new -nodes -x509 -newkey rsa:8192 -sha256 -days 365 \
-keyout /etc/nginx/ssl/dlaidet.key \
-out /etc/nginx/ssl/dlaidet.pem \
-subj "/C=FR/ST=Charente/L=Angouleme/O=42School/CN=dlaidet.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
