FROM node

#Assign variables
ARG CLIURL=https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz  
ARG SFDX_AUTOUPDATE_DISABLE=false
ARG SFDX_USE_GENERIC_UNIX_KEYCHAIN=true
ARG SFDX_DOMAIN_RETRY=300
ARG SFDX_DISABLE_APP_HUB=true
ARG SFDX_LOG_LEVEL=DEBUG
ARG ROOTDIR=force-app/main/default/
ARG TESTLEVEL=RunLocalTests

#Create sfdx directory
RUN mkdir sfdx

#Install Salesforce CLI
RUN wget -qO- $CLIURL | tar xJ -C sfdx --strip-components 1
RUN ./sfdx/install
RUN export PATH=./sfdx/$(pwd):$PATH
RUN sfdx --version
RUN sfdx plugins --core
