FROM node

#RUN apt-get update
#RUN apt-get -f install
#RUN apt-get -y install ant
#RUN apt-get -y install wget
#RUN apt-get install -y xz-utils
#RUN wget -qO- "https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz" | tar xJf -
#RUN ./heroku/install
#RUN export PATH=./heroku/$(pwd):$PATH
#RUN sfdx force --help

#Assign variables 
RUN export CLIURL=https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz  
RUN export SFDX_AUTOUPDATE_DISABLE=false
RUN export SFDX_USE_GENERIC_UNIX_KEYCHAIN=true
RUN export SFDX_DOMAIN_RETRY=300
RUN export SFDX_DISABLE_APP_HUB=true
RUN export SFDX_LOG_LEVEL=DEBUG
RUN export ROOTDIR=force-app/main/default/
RUN export TESTLEVEL=RunLocalTests
#Create sfdx directory
RUN mkdir sfdx
#Install Salesforce CLI
RUN wget -qO- ${CLIURL} | tar xJ -C sfdx --strip-components 1
RUN ./sfdx/install
RUN export PATH=./sfdx/$(pwd):$PATH
RUN sfdx --version
RUN sfdx plugins --core
#Install JSON processor
RUN apt-get install -y jq
