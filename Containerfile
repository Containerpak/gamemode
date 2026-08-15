FROM ghcr.io/containerpak/wine:main

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        dbus-bin \
        gamemode \
        libgamemode0:i386 \
        libgamemodeauto0:i386 && \
    mkdir -p \
        /usr/lib/cpak-gamemode/lib/i386-linux-gnu \
        /usr/lib/cpak-gamemode/lib/x86_64-linux-gnu && \
    cp -a /usr/lib/i386-linux-gnu/libgamemode.so* /usr/lib/cpak-gamemode/lib/i386-linux-gnu/ && \
    cp -a /usr/lib/i386-linux-gnu/libgamemodeauto.so.0* /usr/lib/cpak-gamemode/lib/i386-linux-gnu/ && \
    cp -a /usr/lib/x86_64-linux-gnu/libgamemode.so* /usr/lib/cpak-gamemode/lib/x86_64-linux-gnu/ && \
    cp -a /usr/lib/x86_64-linux-gnu/libgamemodeauto.so.0* /usr/lib/cpak-gamemode/lib/x86_64-linux-gnu/ && \
    cpak-clean-junk

COPY --chmod=0755 gamemoderun /usr/bin/gamemoderun
