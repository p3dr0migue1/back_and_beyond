ENV PYTHONUNBUFFERED 1

RUN apk add --update --no-cache \
        python3-dev \
        libmemcached \
        libmemcached-dev \
        postgresql-dev \
        postgresql-client \
    && apk add --virtual .build-deps gcc musl-dev

COPY requirements.txt /code/
RUN python -m pip install --upgrade pip \
    && python -m pip install -r /code/requirements.txt --no-cache-dir \
    && apk --purge del .build-deps gcc musl-dev

COPY . /code

RUN adduser -D pedro
USER pedro

WORKDIR /code
CMD [ "./wait-for-it.sh" ]i
