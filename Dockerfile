FROM ubuntu
RUN apt-get update
RUN apt-get install -y --no-install-recommends network-manager-vpnc openssh-client
ARG SERVER_DEPLOY_KEY
ARG DEPLOY_SCRIPT_FILENAME

# setup vpnc config & scripts
ADD . .
RUN mv tunnel.conf /etc/vpnc/
RUN mkdir ~/.ssh/
RUN echo "$SERVER_DEPLOY_KEY" | base64 -d > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa
RUN chmod 744 $DEPLOY_SCRIPT_FILENAME

# just keep the container running
CMD ["tail -f /dev/null"]