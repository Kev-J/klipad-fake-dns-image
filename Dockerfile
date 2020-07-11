FROM alpine:3.11

RUN apk update && \
    apk add bind && \
    rm -rf /var/cache/apk/*

# Copy configuration files
COPY named.conf /var/bind/
COPY status.eqoe.cn.zone /var/bind/

# Run eternal loop
CMD ["/bin/sh", "-c", "while :; do sleep 10; done"]
