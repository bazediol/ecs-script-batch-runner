FROM alpine:3.17

RUN apk add --no-cache python3 \
  && apk add --no-cache bash \
  && apk add --no-cache aws-cli

WORKDIR /script

COPY source/ .

ENV TEXT="Default value"
ENV BUCKET_NAME="script-runner-output"

ENTRYPOINT ["python", "main.py"]