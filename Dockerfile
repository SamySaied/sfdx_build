FROM node

RUN apt-get update
RUN apt-get -f install
RUN apt-get -y install ant
RUN apt-get -y install wget
RUN apt-get install -y xz-utils
RUN wget -qO- "https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz" | tar xJf -
RUN ./heroku/install
RUN export PATH=./heroku/$(pwd):$PATH
RUN sfdx force --help
