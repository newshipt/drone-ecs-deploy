FROM alpine:3.5

RUN apk add --update --no-cache \
    curl \
    jq \
    ca-certificates \
    bash \
    python \
    && python -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip install --upgrade pip setuptools \
    awscli --ignore-installed \
    && rm -r /root/.cache

COPY ecs-deploy update.sh /bin/

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/update.sh"]