FROM centos:centos7

RUN yum clean all
RUN yum -y update

RUN yum -y install epel-release && yum clean all
RUN yum -y install rpm-build make zlib-devel openssl-devel curl-devel asciidoc gcc redhat-lsb-core shadow-utils systemd openssl-libs wget libmaxminddb-devel

RUN mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

ADD ./SPECS /root/rpmbuild/SPECS
ADD ./build-rpm.sh /build-rpm.sh

RUN wget http://nginx.org/packages/mainline/centos/7/SRPMS/nginx-1.15.0-1.el7_4.ngx.src.rpm -O /root/rpmbuild/SRPMS/nginx-1.15.0-1.el7_4.ngx.src.rpm
RUN wget https://github.com/leev/ngx_http_geoip2_module/archive/master.zip -O /root/rpmbuild/SOURCES/ngx_http_geoip2_module_master.zip
RUN wget https://github.com/vozlt/nginx-module-vts/archive/master.zip -O /root/rpmbuild/SOURCES/nginx-module-vts_master.zip
RUN wget https://github.com/kriegsmanj/ngx_http_substitutions_filter_module/archive/master.zip -O /root/rpmbuild/SOURCES/ngx_http_substitutions_filter_module_master.zip
RUN rpm -Uvh /root/rpmbuild/SRPMS/nginx-1.15.0-1.el7_4.ngx.src.rpm
RUN chmod +x /build-rpm.sh


VOLUME ["/rpms"]

CMD ["/build-rpm.sh"]
