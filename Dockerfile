FROM alpine


### So logging/io works reliably w/Docker
ENV PYTHONUNBUFFERED=1
### UTF Python issue for Click package (pipenv dependency)
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
### Need to explicitly set this so `pipenv shell` works
ENV SHELL=/bin/bash

COPY ./adventuretutorial /adventuretutorial
COPY ./resources /resources

### Basic Python dev dependencies
RUN apk update && \
  apk upgrade && \
  apk add python3 && \
  python3 -m ensurepip && \
  pip3 install --upgrade pip setuptools wheel

CMD python3 /adventuretutorial/game.py