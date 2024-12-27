FROM ubuntu:24.04

ARG RUNNER_VERSION="2.321.0"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y
RUN apt install -y --no-install-recommends \
    curl jq build-essential docker.io libssl-dev libffi-dev libicu74 python3 python3-venv python3-dev python3-pip


RUN useradd -rm -g docker -G sudo -u 1001 runner && cd /home/runner && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && rm -f ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz


RUN chown -R runner ~runner && /home/runner/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh
RUN chmod +x start.sh

USER runner
ENTRYPOINT ["./start.sh"]
