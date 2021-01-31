FROM python:3.7-alpine AS builder

ENV PYTHONUNBUFFERED 1

COPY . /code/

RUN apk add --no-cache libmemcached-dev \
        postgresql-dev \
        postgresql-client \
    && apk add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install --upgrade pip \
    && pip install -r /code/requirements.txt --no-cache-dir \
    && apk --purge del .build-deps gcc musl-dev

FROM builder as final

WORKDIR /code/

CMD [ "./wait-for-it.sh" ]
