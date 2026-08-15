FROM ghcr.io/containerpak/wine:main

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        dbus-bin \
        gamemode \
        libgamemode0:i386 \
        libgamemodeauto0:i386 && \
    cpak-clean-junk

COPY --chmod=0755 gamemoderun /usr/bin/gamemoderun
