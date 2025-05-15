# Grab base image from Docker Hub
FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y git vim curl zsh bash build-essential procps curl file language-pack-en

WORKDIR /root/dotfiles/

# Copy the scripts files from the current directory into the container's working directory
COPY . .

# Verify file existence (debugging step)
RUN ls -l

# Make the brew-install.sh script executable
RUN chmod +x setup/brew-install.sh setup.sh

# Start bash
CMD ["bash"]