FROM golang:1.7.3-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN go get -v github.com/banzo/mattermail

RUN chmod +x bin/mattermail
ENTRYPOINT cd bin && ./mattermail -c /etc/mattermail/config.json > /var/log/mattermail.log
