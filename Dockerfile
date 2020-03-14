FROM alpine
RUN apk add --no-cache openssh openresolv wireguard-tools
ARG SERVER_DEPLOY_KEY

# setup vpnc config & scripts
ADD . .
RUN mv tunnel.conf /etc/wireguard/
RUN mkdir ~/.ssh/
RUN echo "$SERVER_DEPLOY_KEY" | base64 -d > ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa

# just keep the container running
CMD ["tail -f /dev/null"]
