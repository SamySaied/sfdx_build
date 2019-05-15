FROM node

#Assign variables
ARG CLIURL=https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz  
ENV SFDX_AUTOUPDATE_DISABLE=false
ENV SFDX_USE_GENERIC_UNIX_KEYCHAIN=true
ENV SFDX_DOMAIN_RETRY=300
ENV SFDX_DISABLE_APP_HUB=true
ENV SFDX_LOG_LEVEL=DEBUG
ENV ROOTDIR=force-app/main/default/
ENV TESTLEVEL=RunLocalTests

#Create sfdx directory
RUN mkdir sfdx

#Install Salesforce CLI
RUN wget -qO- $CLIURL | tar xJ -C sfdx --strip-components 1
RUN ./sfdx/install
RUN export PATH=./sfdx/$(pwd):$PATH
RUN sfdx --version
RUN sfdx plugins --core

# install git
RUN apt-get update \
    apt-get upgrade \
    apt-get install git
