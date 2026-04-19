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
    ca-certificates \
    curl \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://claude.ai/install.sh | bash

RUN ln -sf "$HOME/.local/bin/claude" /usr/local/bin/claude

RUN which claude \
  && claude --version

CMD ["claude"]
