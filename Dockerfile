FROM nginx:1.11.10

COPY bins/ngx_rtmp_module.so /usr/lib/nginx/modules/ngx_rtmp_module.so

RUN rm -f /etc/nginx/conf.d/default.conf

# needed for rtmp module apparently
RUN mkdir -p /etc/nginx/logs
RUN ln -sf /dev/stdout /etc/nginx/logs/access.log

VOLUME ["/etc/nginx/conf.d"]

EXPOSE 1935
