FROM ubuntu:20.04

# Disable interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    git \
    unzip \
    jq \
    libcurl4-openssl-dev \
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create runner folder and install runner
WORKDIR /runner
RUN curl -O -L https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-x64-2.299.1.tar.gz \
    && tar xzf actions-runner-linux-x64-2.299.1.tar.gz

# Add entrypoint
COPY entrypoint.sh /runner/entrypoint.sh
RUN chmod +x /runner/entrypoint.sh

ENTRYPOINT ["/runner/entrypoint.sh"]
