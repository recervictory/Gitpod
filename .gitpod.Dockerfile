FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y wget bzip2 ca-certificates git libarchive-dev

# Create a non-root user and home directory
RUN useradd -m myuser
USER myuser
WORKDIR /home/myuser

# Download and install Miniconda
RUN wget -qO /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /tmp/miniconda.sh -b -p /home/myuser/miniconda && \
    rm /tmp/miniconda.sh

# Add Miniconda to the PATH
ENV PATH /home/myuser/miniconda/bin:$PATH



# Set the default command to bash
CMD ["bash"]







