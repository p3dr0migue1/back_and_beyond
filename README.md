[![Build Status](https://travis-ci.org/p3dr0migue1/back_and_beyond.svg?branch=master)](https://travis-ci.org/p3dr0migue1/back_and_beyond) [![codecov](https://codecov.io/gh/p3dr0migue1/back_and_beyond/branch/master/graph/badge.svg)](https://codecov.io/gh/p3dr0migue1/back_and_beyond)

# Back&Beyond

## Install docker for your OS

## Clone this repo
```sh
git clone git@github.com:p3dr0migue1/back_and_beyond.git
```

## Create an environment file
Create an environment file named `.env` and add the following variables
```sh
DATABASE_URL=postgres://user:test@db:5432/backandbeyond
DEBUG=True
```

## Development with Docker & docker-compose
Build the image
```sh
docker-compose build
```

Start containers
```sh
docker-compose up
```

* [Install required libraries](docs/development.md#install-project-dependencies)
* [Run the API server](docs/development.md#run-the-api-server)
* [Running tests](docs/development.md#running-tests)

