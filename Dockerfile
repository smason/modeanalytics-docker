FROM debian:jessie

# Get their stuff installed
RUN \
  apt-get update && apt-get install -y --no-install-recommends ca-certificates curl sudo && \
  curl -L https://packagecloud.io/install/repositories/modeanalytics/main/script.deb.sh | bash && \
  apt-get install -y mode-bridge &&  \
  apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/*

USER modeanalytics
ENTRYPOINT /opt/mode/bridge/bin/mode-bridge
