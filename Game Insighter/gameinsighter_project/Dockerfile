FROM ubuntu

COPY . /gameinsighter_project
WORKDIR /gameinsighter_project
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  python3-pip \
  python3-dev \
  default-libmysqlclient-dev \
  build-essential \
  gunicorn \
  && rm -rf /var/lib/apt/lists/*
RUN pip3 install -r requirements.txt
ENTRYPOINT [ "/bin/bash","/gameinsighter_project/scripts/start.sh" ]