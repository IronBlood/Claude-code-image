# Tasks

## Convention

> Note: this section is maintained by human contributors. Do NOT edit this part or treat this section as real tasks. This section only explained how to mark the state of a task.

- [ ] A task
- [+] An on-going task
- [?] An on-going task which needs human contributors to confirm blocks.
- [x] A finished task

## Task Lists

### Shared Base Image

- [x] Use `debian:bookworm-slim` as the base image for the shared Claude image.
- [x] Install the Debian runtime utilities required by version 1: `bash`, `git`, `sed`, `awk`, and `ripgrep`.
- [x] Install Claude Code with the official setup method during image build.
- [x] Make the installed `claude` binary available on a global `PATH` instead of leaving it only under `$HOME/.local/bin`.
- [x] Verify the Claude Code installation during image build with `which claude` and `claude --version`.
- [x] Confirm that the official Claude Code installer works reliably and non-interactively in the image build.
- [ ] Add a dedicated Dockerfile for the shared base image and move the shared installation steps into it.
- [ ] Add or update CI to build the shared base image and publish it to GHCR.

### User Image Template

- [ ] Add a committed user-image template Dockerfile that builds on the published shared base image.
- [ ] Document or encode the base-image reference in the user-image template so it can be adjusted per user.

### Private User-Specific Runtime Image

- [ ] Create the private user-facing Dockerfile from the committed template.
- [ ] Make the private user-facing Dockerfile use the published shared base image.
- [ ] Set a fixed in-container home directory path and export it as `HOME` in the private user-facing image.
- [ ] Ensure the fixed in-container home directory path exists without requiring a real in-container user account.
- [ ] Set the final user-facing image default behavior to start Claude Code directly instead of opening a shell.
- [ ] Make the image compatible with running under `--user $(id -u):$(id -g)`.
- [ ] Make the runtime working directory match the bind-mounted project path passed with `-w $WORKING_DIR`.
- [ ] Make the Claude configuration paths inside the container resolve to the fixed in-container home directory path.
