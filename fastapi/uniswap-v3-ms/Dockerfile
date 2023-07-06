FROM python:3.10-slim

USER root
RUN apt-get update && apt-get install -y git

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
COPY ./app /code/app

RUN pip3 install --no-cache-dir --upgrade -r /code/requirements.txt
RUN pip3 install -e "git+https://github.com/e183b796621afbf902067460/raffaelo.git#egg=raffaelo_uniswap_v3&subdirectory=_modules/raffaelo-uniswap-v3/"
RUN pip3 install -e "git+https://github.com/e183b796621afbf902067460/bs-thesis.git#egg=bs_infrastructure&subdirectory=_modules/bs-infrastructure/"