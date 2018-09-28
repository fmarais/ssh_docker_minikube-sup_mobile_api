FROM nginx:stable-alpine

RUN apk update \
  && apk add \
    build-base \
    python-dev \
    py-pip \
  && pip install gunicorn

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY src/requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ /usr/src/app/

COPY configs/nginx.conf /etc/nginx/
COPY configs/files/ /

# Logs
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY configs/newrelic.ini /
ENV NEW_RELIC_CONFIG_FILE /newrelic.ini
ARG HASH=local
ENV SENTRY_RELEASE=${HASH}

EXPOSE 5000

### start copy ssh
RUN apk --update add --no-cache openssh bash \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd \
  && rm -rf /var/cache/apk/*

RUN sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
RUN sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config
RUN sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config

RUN /usr/bin/ssh-keygen -A
RUN ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22
### end copy ssh

### start copy pycharm
EXPOSE 12345
### end copy pycharm

# original command
#CMD nginx && newrelic-admin run-program gunicorn --log-config /etc/gunicorn/logging.conf -c /etc/gunicorn/gunicorn.py manage:app
CMD /usr/sbin/sshd && nginx && newrelic-admin run-program gunicorn --log-config /etc/gunicorn/logging.conf -c /etc/gunicorn/gunicorn.py manage:app
