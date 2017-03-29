FROM debian:latest

# Get their script across
COPY script.deb.sh /

# Get their stuff installed
RUN \
  apt-get update && apt-get install -y --no-install-recommends ca-certificates curl sudo && \
  bash script.deb.sh && apt-get update && apt-get install -y mode-bridge &&  \
  apt-get purge -y --auto-remove curl && rm -rf /var/lib/apt/lists/*

ENTRYPOINT sudo -u modeanalytics /opt/mode/bridge/bin/mode-bridge
