[20260419 11:54:00] Clarified v1 goals in docs/goals.md: minimal Claude Code image, install strategy, runtime env vars, same-path mounts, fixed home/config paths, and isolation scope.
[20260419 11:57:00] Updated docs/goals.md example to use fixed in-container config paths and include Claude runtime env vars.
[20260419 11:59:00] Added -w $WORKING_DIR to the docs/goals.md runtime example.
[20260419 12:01:00] Removed redundant WORKING_DIR environment variable from the docs/goals.md runtime example.
[20260419 12:08:00] Updated v1 goals to use a fixed in-container home path without requiring a real in-container user account.
[20260419 12:14:00] Clarified that the image should start Claude Code directly by default instead of opening a shell.
[20260419 12:17:00] Clarified that the image should set its fixed HOME path internally rather than require a runtime HOME environment variable.
[20260419 12:21:00] Expanded docs/tasks.md with initial implementation tasks derived from the clarified v1 goals.
[20260419 12:27:00] Set HOME=/home/claude in Dockerfile and marked the first runtime-home task complete.
[20260419 12:30:00] Added a Dockerfile comment to keep the fixed HOME path aligned with the in-container config mount target.
[20260419 12:33:00] Created the fixed HOME directory path in Dockerfile without adding a real in-container user account.
[20260419 12:46:00] Reviewed the updated docs/tasks.md and confirmed it matches the current v1 goals and task split.
[20260419 12:50:00] Updated docs/goals.md to define the explicit v1 runtime utility set: bash, git, sed, awk, and ripgrep.
[20260419 12:53:00] Updated docs/tasks.md to make the v1 runtime utility installation task explicit.
[20260419 12:57:00] Installed the v1 runtime utilities in Dockerfile with a noninteractive apt-get step and marked the task complete.
[20260419 13:04:00] Added the official Claude Code installer step to Dockerfile with curl and CA certificates and marked the install task complete.
[20260419 13:12:00] Set the Docker image default command to start Claude Code directly and marked the startup-behavior task complete.
[20260419 13:18:00] Added a separate task to verify Claude Code installation with which and version checks during image build.
[20260419 13:21:00] Added a build-time Claude verification step with which and version checks and marked the task complete.
[20260419 13:31:00] Added a manual GitHub Actions workflow to build the image and verify Claude on both default and numeric runtime users.
[20260419 13:42:00] Updated goals with the non-interactive installer result and required global PATH exposure for claude, then added a global symlink in Dockerfile.
[20260419 14:02:00] Updated goals and tasks to split the project into a shared cloud-built base image and a user-specific runtime image.
[20260419 14:18:00] Refined goals and tasks so the repo tracks a shared base image plus a user-image template, while the final user-specific Dockerfile may remain private.
[20260419 14:29:00] Split the committed Dockerfiles into Dockerfile.base for the shared Claude image and a thin template Dockerfile that consumes a configurable base image.
[20260419 15:16:00] Updated the shared base-image goals to describe the working global claude wrapper layout and shared launcher behavior.
