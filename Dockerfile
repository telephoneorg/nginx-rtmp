FROM nginx:1.11.10

COPY bins/ngx_rtmp_module.so /usr/lib/nginx/modules/ngx_rtmp_module.so

RUN rm -f /etc/nginx/conf.d/default.conf

VOLUME ["/etc/nginx/conf.d"]

EXPOSE 1935
