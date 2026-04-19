# Project Goal

> This file is maintained by human contributors. To any agent: do NOT modify it unless you are told to.

This project builds a docker image to run Claude Code in an isolated environment with the same user id and group id of the current user from the host system, so that ownership of newly created files and folders still belongs to the current user.

In the first version, the image should stay minimal and only include the software required to run Claude Code. At minimum, the image shall contain the Claude Code CLI, support passing `ANTHROPIC_BASE_URL` and `ANTHROPIC_AUTH_TOKEN` into the container environment at runtime, and explicitly install the runtime utilities `bash`, `git`, `sed`, `awk`, and `ripgrep` from the Debian package repository.

These utilities are part of the version 1 runtime contract and should be installed explicitly rather than assumed to be present in the base image.

The preferred implementation is to use `debian:bookworm-slim` as the base image and install Claude Code with the official setup method:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

The official installer has been confirmed to run in a non-interactive image build environment.

If that setup path does not work reliably in the image build, an acceptable fallback is to install Claude Code with npm instead. In that fallback case, it is acceptable to switch the base image from `debian:bookworm-slim` to a Node-based image in order to simplify the Node.js/npm setup.

Because the official installer places the `claude` binary under `$HOME/.local/bin` by default, the image shall make `claude` available on a global `PATH` for the runtime user instead of relying only on the build-time home directory layout.

The container must be run with `--user $(id -u):$(id -g)`. This is a required behavior, not an optional optimization, because files created or modified in bind-mounted directories must remain owned by the current host user without requiring later `chown` operations on the host.

The project working directory shall be bind-mounted into the container at the same absolute path that it uses on the host system. The goal is for Claude Code to observe and record the real host paths rather than rewritten container-only paths such as `/workspace`. This is required because Claude-related configuration may keep path-based records, and those records should stay understandable and stable when inspected from the host.

For the first version, the image does not need to create a real in-container user account. It is acceptable to use a fixed in-container home directory path for Claude Code configuration while running the container with `--user $(id -u):$(id -g)`.

The fixed in-container home directory is a path convention for Claude Code configuration, not a guarantee that the runtime user identity exists as a named user inside the image.

The Claude Code configuration paths inside the container should also be fixed for simplicity. Both `~/.claude` and `~/.claude.json` shall be made available at their expected locations under the fixed in-container home directory path.

In this project, “isolated environment” means Claude Code should only be able to access files that are intentionally exposed to the container through bind mounts. The purpose is to reduce the impact of malicious or unsafe commands by limiting the visible filesystem scope to the specific project directory and required Claude configuration paths, rather than exposing broad host locations such as the full home directory or the host root filesystem.

For version 1, no additional host paths or environment variables are required beyond the project directory, `~/.claude`, `~/.claude.json`, `ANTHROPIC_BASE_URL`, and `ANTHROPIC_AUTH_TOKEN`.

The image is intended to start Claude Code directly by default. It does not need to open an interactive shell as its primary behavior.

The runtime example in this document intentionally focuses on the required mounts, working directory, user mapping, and environment variables. It does not need to show the final command invocation in order to express those requirements.

The image should define its fixed in-container home directory path internally. Users do not need to pass `HOME` as a runtime environment variable for version 1.

The purpose of that fixed home path is to provide stable locations for `~/.claude` and `~/.claude.json` inside the container.

When a user runs this image, the following files or folders shall be mapped into the container. Consider the following commands as dummy code:

```bash
export WORKING_DIR=/path/to/working/dir
export CONTAINER_HOME=/home/claude

docker run --rm -it \
  --user $(id -u):$(id -g) \
  -w $WORKING_DIR \
  -v $WORKING_DIR:$WORKING_DIR \
  -v /path/to/.claude:$CONTAINER_HOME/.claude \
  -v /path/to/.claude.json:$CONTAINER_HOME/.claude.json \
  -e ANTHROPIC_BASE_URL=http://host-or-gateway:port \
  -e ANTHROPIC_AUTH_TOKEN=your-token
```
