FROM debian:bookworm-slim

# Keep this fixed path aligned with the in-container config mount target.
ENV HOME=/home/claude

RUN mkdir -p "$HOME"
