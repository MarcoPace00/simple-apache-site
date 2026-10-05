FROM httpd:2.4

# Site content
COPY ./public-html/ /usr/local/apache2/htdocs/

# Custom settings
COPY ./conf/site.conf /usr/local/apache2/conf/extra/site.conf
RUN echo "Include conf/extra/site.conf" >> /usr/local/apache2/conf/httpd.conf

EXPOSE 80
