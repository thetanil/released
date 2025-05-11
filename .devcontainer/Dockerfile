ARG VARIANT="11.11-slim"
FROM debian:${VARIANT} AS base

ARG ARCH="amd64"
ENV GOTASK_VERSION=3.43.2
# ENV PATH=/usr/local/go/bin:$PATH

# Build arguments for user and group IDs
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

# Install dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git && \
    rm -rf /var/lib/apt/lists/*

# Install gotask
RUN curl -fsSL https://github.com/go-task/task/releases/download/v${GOTASK_VERSION}/task_linux_${ARCH}.tar.gz | tar -C /usr/local/bin -xz task

# Create a non-root user matching the host user
RUN groupadd -g ${USER_GID} ${USERNAME} && \
    useradd -m -u ${USER_UID} -g ${USER_GID} -s /bin/bash ${USERNAME} && \
    mkdir -p /home/${USERNAME}/workspace && \
    chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}

FROM base AS dev
USER ${USERNAME}
WORKDIR /home/${USERNAME}/workspace
CMD ["/bin/sh"]

########### CI ###########

FROM base AS ci
USER ${USERNAME}
WORKDIR /home/${USERNAME}/workspace
CMD ["/bin/sh"]

