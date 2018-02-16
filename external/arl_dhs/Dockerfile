FROM sdal/mro-c7sd_auth
MAINTAINER "Aaron D. Schroeder" <aschroed@vt.edu>

## Add RStudio binaries to PATH
ENV PATH /usr/lib/rstudio-server/bin/:$PATH

## Install Download Prerequisites
RUN yum install -y initscripts
RUN cp /etc/pam.d/login /etc/pam.d/rstudio

## Download and Install Rstudio-server
RUN curl -O https://download2.rstudio.org/rstudio-server-rhel-1.1.419-x86_64.rpm
RUN yum install -y --nogpgcheck rstudio-server-rhel-*.rpm
RUN systemctl enable rstudio-server

# Add default rstudio user with pass rstudio
RUN useradd -m -d /home/rstudio rstudio && echo rstudio:rstudio | chpasswd

# Get the Rprofile.site file
# RUN wget -O /usr/lib64/R/etc/Rprofile.site https://raw.githubusercontent.com/bi-sdal/mro-ldap-ssh-c7/master/Rprofile.site

EXPOSE 8787

RUN yum install -y cronie && systemctl enable crond

COPY share_dir.sh /etc/share_dir.sh
COPY share_dir.service /etc/systemd/system/share_dir.service
RUN chmod +x /etc/share_dir.sh
RUN mkdir /home/share
RUN chmod 777 /home/share

RUN systemctl enable share_dir.service
CMD ["/lib/systemd/systemd"]
#CMD ["/usr/sbin/init"]
