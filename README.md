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

## Running tests
Running all tests
```sh
./manage.py test
```

Running specific test module
```sh
./manage.py test blog.tests.TestTags.test_creating_a_new_tag_in_popup_window_requires_a_tag_name
```

Running one test case
```sh
./manage.py test test_views.
