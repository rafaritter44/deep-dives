FROM postgres:18

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libmagic-dev \
    postgresql-server-dev-18 \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/nmandery/pg_byteamagic.git /tmp/pg_byteamagic \
    && cd /tmp/pg_byteamagic \
    && make \
    && make install \
    && rm -rf /tmp/pg_byteamagic