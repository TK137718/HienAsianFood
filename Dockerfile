FROM node:25-bookworm-slim

RUN apt-get update && apt-get install -y curl bash-completion sudo git && rm -rf /var/lib/apt/lists/*

# setup flask application directory
RUN mkdir /app
WORKDIR /app

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user && chown -R user:user /app
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
RUN chmod 777 /opt

USER user

CMD ['npm', 'run', 'dev']