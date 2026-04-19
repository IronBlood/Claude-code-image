ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG CONTAINER_HOME=/home/claude

# Keep this fixed path aligned with the in-container config mount target.
ENV HOME=${CONTAINER_HOME}

RUN mkdir -p "$HOME"

CMD ["claude"]
