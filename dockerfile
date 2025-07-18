FROM python:3-alpine
RUN pip install --upgrade pip wheel && \
        pip install httpie veracode-api-signing
RUN mkdir /$HOME/.veracode
VOLUME /project
WORKDIR /project

#RUN --mount=type=bind,source=C:\Users\WilliamTrotter\.veracode\credentials,target=$HOME/.veracode/credentials
ENTRYPOINT [ "http", "--auth-type=veracode_hmac" ]
CMD [ "--help" ]