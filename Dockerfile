FROM ghcr.io/brittonhayes/armactl:latest as armactl

FROM gameservermanagers/gameserver:armar

LABEL maintainer="Britton - github.com/brittonhayes"
LABEL org.opencontainers.image.source=https://github.com/brittonhayes/arma-reforger-helm

COPY --from=armactl /bin/armactl /usr/bin/armactl

# Linux GSM
ENV GAMESERVER=armarserver
ENV LGSM_GITHUBUSER=GameServerManagers
ENV LGSM_GITHUBREPO=LinuxGSM
ENV LGSM_GITHUBBRANCH=master

EXPOSE 2001/udp
EXPOSE 17777/udp

# Insecure workaround for failing symlink during install
RUN sudo chown -R linuxgsm:linuxgsm /root

ENTRYPOINT [ "/init" ]

CMD ["./entrypoint.sh"]