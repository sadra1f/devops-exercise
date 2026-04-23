FROM ubuntu:24.04

# Build argument for apt mirror with default fallback
ARG APT_MIRROR=""

# Configure apt mirror if provided
RUN if [ -n "$APT_MIRROR" ]; then \
        sed -i "s|http://archive.ubuntu.com/ubuntu/|${APT_MIRROR}|g" /etc/apt/sources.list.d/ubuntu.sources && \
        sed -i "s|http://security.ubuntu.com/ubuntu/|${APT_MIRROR}|g" /etc/apt/sources.list.d/ubuntu.sources; \
    fi;

# Install OpenSSH server
RUN apt update \
    && apt install -y openssh-server \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*;

# Create privilege separation directory
RUN mkdir -p /run/sshd;

# Configure SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config;

# Set root password (change this or use SSH keys in production)
RUN echo 'root:password' | chpasswd

# Expose SSH port
EXPOSE 22

# Keep container running and start SSH service
CMD ["/usr/sbin/sshd", "-D"]
