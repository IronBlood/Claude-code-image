FROM debian:bookworm-slim

# Keep this fixed path aligned with the in-container config mount target.
ENV HOME=/home/claude

RUN mkdir -p "$HOME"

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && apt-get install -y --no-install-recommends \
    bash \
    git \
    sed \
    gawk \
    ripgrep \
  && rm -rf /var/lib/apt/lists/*
