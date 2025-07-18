FROM python:3-alpine
RUN apk -v --no-cache add \
        groff \
        less \
        mailcap \
        && \
        pip install --upgrade pip wheel && \
        pip install httpie veracode-api-signing python-magic
RUN mkdir /$HOME/.veracode
VOLUME /project
WORKDIR /project

ENTRYPOINT [ "http", "--auth-type=veracode_hmac" ]
CMD [ "--help" ]