FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    jq \
    libcurl4-openssl-dev \
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /runner
RUN curl -O -L https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-x64-2.299.1.tar.gz \
    && tar xzf actions-runner-linux-x64-2.299.1.tar.gz

COPY entrypoint.sh /runner/entrypoint.sh
RUN chmod +x /runner/entrypoint.sh

ENTRYPOINT ["/runner/entrypoint.sh"]
