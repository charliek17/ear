FROM nginx
EXPOSE 443
RUN apt-get update
RUN apt-get install -y wget jq
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
#COPY els.crt /usr/share/nginx/certs/els.crt
#COPY els.key /usr/share/nginx/certs/els.key
COPY bash.sh /opt/bash.sh
#COPY EMS_PLANTTILES.sh /opt/EMS_PLANTTILES.sh
#COPY ece_image_pull.sh /opt/ece_image_pull.sh
#COPY ece-images /opt/ece-images
#RUN ["chmod", "+x", "/opt/EMS_PLANTTILES.sh"]
#RUN ["chmod", "+x", "/opt/ece_image_pull.sh"]
RUN ["chmod", "+x", "/opt/bash.sh"]
#RUN /opt/EMS_PLANTTILES.sh
#RUN /opt/ece_image_pull.sh
RUN /opt/bash.sh
RUN chown -R nginx:nginx /usr/share/nginx/*
RUN chmod 755 -R /usr/share/nginx/
#CMD ["/bin/bash", "/opt/copy_to"]

