FROM ubuntu
RUN apt-get update
RUN apt-get install -y --no-install-recommends network-manager-vpnc openssh-client
ARG circleCIDeployKey
ARG deployScript

# setup vpnc config & scripts
ADD . .
RUN mv tunnel.conf /etc/vpnc/
RUN mkdir ~/.ssh/
RUN echo "$circleCIDeployKey" | base64 -d > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa
RUN chmod 744 $deployScript

# just keep the container running
CMD ["tail -f /dev/null"]