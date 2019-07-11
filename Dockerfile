FROM ubuntu
RUN apt-get update
RUN apt-get install -y --no-install-recommends network-manager-vpnc
ARG circleCIDeployKey

# setup vpnc config & scripts
ADD . .
RUN mv tunnel.conf /etc/vpnc/
RUN mkdir ~/.ssh/
RUN echo "$circleCIDeployKey" | base64 -d > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa
RUN chmod 744 deploy.sh

# just keep the container running
CMD ["tail -f /dev/null"]