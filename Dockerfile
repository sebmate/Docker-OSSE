FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install required software packages:

RUN apt-get update
RUN apt-get install -y -y wget

# Expose port 8080 to the client:

EXPOSE 8080

RUN echo "\n#OSSE Demo package repository\n deb http://packages.osse-register.de/apt/debian/osse-demo trusty main\n" >> /etc/apt/sources.list.d/osse.list

#RUN echo -e '\n#OSSE Productive package repository\ndeb http://packages.osse-register.de/apt/debian/osse trusty main\n' >>/etc/apt/sources.list.d/osse.list

RUN wget -qO - http://packages.osse-register.de/apt/debian/osse/osserepo.gpg.key |  apt-key add -

RUN apt-get update

RUN apt-get install -y -y authbind ca-certificates-java curl default-jre-headless fontconfig-config fonts-dejavu-core java-common krb5-locales libasn1-8-heimdal libasyncns0 libavahi-client3 libavahi-common-data libavahi-common3 libcommons-collections3-java libcommons-dbcp-java libcommons-pool-java libcups2 libcurl3 libecj-java libedit2 libflac8 libfontconfig1 libfreetype6 libgeronimo-jta-1.1-spec-java libglib2.0-0 libglib2.0-data libgssapi-krb5-2 libgssapi3-heimdal libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhx509-5-heimdal libjpeg-turbo8 libjpeg8 libk5crypto3 libkeyutils1 libkrb5-26-heimdal libkrb5-3 libkrb5support0 liblcms2-2 libldap-2.4-2 libnspr4 libnss3 libnss3-nssdb libogg0 libpcsclite1 libpq5 libpulse0 libroken18-heimdal librtmp0 libsasl2-2 libsasl2-modules libsasl2-modules-db libsctp1 libservlet3.0-java libsndfile1 libtomcat7-java libv8-3.14.5 libvorbis0a libvorbisenc2 libwind0-heimdal libwrap0 libxau6 libxcb1 libxdmcp6 libxml2 lksctp-tools openjdk-7-jre-headless postgresql-9.3 postgresql-9.3-plv8 postgresql-client-9.3 postgresql-client-common postgresql-common sgml-base shared-mime-info ssl-cert tcpd tomcat7 tomcat7-common tomcat7-user tzdata-java unzip xml-core zip

#RUN apt-get install -y -y osse-demo

RUN apt-get download osse-demo mainzelliste osse-commons osse-datamanagement-demo osse-edc-demo osse-idmanagement-demo osse-share-demo osse-store-rest

RUN apt-get install -y -y lsof

CMD /bin/bash
