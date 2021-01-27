FROM alpine:latest

RUN apk add --update --no-cache ansible openssh openrc git curl \
&& rm -rf /var/cache/apk/* && rc-update add sshd

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_SSH_PIPELINING True

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/ansible --version"]

