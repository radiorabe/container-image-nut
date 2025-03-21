FROM ghcr.io/radiorabe/ubi9-minimal:0.8.2

RUN    microdnf install -y epel-release \
    && microdnf install -y \
         nut \
    && microdnf clean all \
    && mkdir /etc/nut /var/run/upsmon \
    && chown nut /etc/nut /var/run/upsmon \
    && chmod o-rwx /etc/nut /var/run/upsmon \
    && chmod a-s \
         /usr/bin/* \
         /usr/sbin/* \
         /usr/libexec/*/*

COPY entrypoint.sh /usr/local/bin/
         
USER 57
EXPOSE 3493
ENTRYPOINT /usr/local/bin/entrypoint.sh
