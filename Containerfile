FROM ghcr.io/containerpak/wine:main

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        dbus-bin \
        gamemode \
        libgamemode0:i386 \
        libgamemodeauto0:i386 && \
    mkdir -p /usr/lib/cpak-gamemode/lib32 /usr/lib/cpak-gamemode/lib64 && \
    cp -a /usr/lib/i386-linux-gnu/libgamemodeauto.so.0* /usr/lib/cpak-gamemode/lib32/ && \
    cp -a /usr/lib/x86_64-linux-gnu/libgamemodeauto.so.0* /usr/lib/cpak-gamemode/lib64/ && \
    cpak-clean-junk

COPY --chmod=0755 gamemoderun /usr/bin/gamemoderun
