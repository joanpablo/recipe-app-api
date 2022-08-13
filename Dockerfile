FROM python:3.11.0b5-alpine3.16
LABEL maintainer="johnpjm"

ARG USER_ID
ARG DEV=false

ENV PAYTHONUNBUFFERED 1

COPY ./requeriments.txt /tmp/requeriments.txt
COPY ./requeriments.dev.txt /tmp/requeriments.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requeriments.txt && \
    if [ $DEV = "true" ]; \
    then /py/bin/pip install -r /tmp/requeriments.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser -D -H -u $USER_ID django-user

ENV PATH="/py/bin:$PATH"

USER django-user