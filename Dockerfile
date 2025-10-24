FROM node:25-bookworm-slim

RUN apt-get update && apt-get install -y curl bash-completion sudo git && rm -rf /var/lib/apt/lists/*