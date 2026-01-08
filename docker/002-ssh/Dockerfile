FROM ubuntu:noble-20251013

RUN apt update \
    && apt install -y openssh-server \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME
ARG PASSWORD

RUN adduser --disabled-password --gecos "" ${USERNAME}
RUN echo "$USERNAME:$PASSWORD" | chpasswd

EXPOSE 22

CMD ["bash", "-c", "service ssh restart && tail -f /dev/null"]
