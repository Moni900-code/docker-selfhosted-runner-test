FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o actions-runner-linux-x64-2.323.0.tar.gz -L \
    https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz \
    && echo "0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19  actions-runner-linux-x64-2.323.0.tar.gz" | shasum -a 256 -c \
    && tar xzf actions-runner-linux-x64-2.323.0.tar.gz \
    && rm actions-runner-linux-x64-2.323.0.tar.gz

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /runner

ENTRYPOINT ["/entrypoint.sh"]
