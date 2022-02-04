FROM python:3.9

COPY Pipfile Pipfile.lock /tmp/pip-tmp/
WORKDIR /tmp/pip-tmp/

RUN apt-get update && apt-get -y upgrade
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install --no-cache-dir pipenv
RUN pipenv install --dev --system
RUN rm -rf /tmp/pip-tmp
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"
