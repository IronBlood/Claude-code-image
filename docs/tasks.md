# Tasks

## Convention

> Note: this section is maintained by human contributors. Do NOT edit this part or treat this section as real tasks. This section only explained how to mark the state of a task.

- [ ] A task
- [+] An on-going task
- [?] An on-going task which needs human contributors to confirm blocks.
- [x] A finished task

## Task Lists

- [x] Use `debian:bookworm-slim` as the base image.
- [x] Set a fixed in-container home directory path and export it as `HOME` in the image.
- [x] Ensure the fixed in-container home directory path exists without requiring a real in-container user account.
- [x] Install the Debian runtime utilities required by version 1: `bash`, `git`, `sed`, `awk`, and `ripgrep`.
- [x] Install Claude Code with the official setup method during image build.
- [x] Verify the Claude Code installation during image build with `which claude` and `claude --version`.
- [x] Set the image default behavior to start Claude Code directly instead of opening a shell.
- [ ] Make the image compatible with running under `--user $(id -u):$(id -g)`.
- [ ] Make the runtime working directory match the bind-mounted project path passed with `-w $WORKING_DIR`.
- [ ] Make the Claude configuration paths inside the container resolve to the fixed in-container home directory path.
- [?] Confirm whether the official Claude Code installer works reliably and non-interactively in the image build; if not, switch to a Node-based image and install Claude Code with npm instead.
