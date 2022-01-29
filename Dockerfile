ARG WINE_BRANCH="stable"
FROM scottyhardy/docker-wine:${WINE_BRANCH}

ENV WINEDEBUG "fixme-all"

ENV RUN_AS_ROOT "yes"
ENV USE_XVFB "yes"
ENV XVFB_SERVER ":95"
ENV XVFB_SCREEN "0"
ENV XVFB_RESOLUTION "1024x768x8"
ENV DISPLAY ":95"

#RUN export DISPLAY=:0 \
#    && (Xvfb $DISPLAY -screen 0 1024x768x24 > /dev/null 2>&1 &) \
#    && wine wineboot --init \
#    && winetricks --unattended --force -q dotnet20 dotnet462 dotnet_verifier \
#    && while pgrep wineserver >/dev/null; do echo "Waiting for wineserver"; sleep 1; done \
#    && rm -rf $HOME/.cache/winetricks

RUN true \
    && export WINEARCH=win32 \
    && export WINEPREFIX="$(realpath ~/.wine32)" \
    && entrypoint wineboot --init \
    && winetricks --unattended --force cmd dotnet20 dotnet472 corefonts \
    && while pgrep wineserver >/dev/null; do echo "Waiting for wineserver"; sleep 1; done \
    && rm -rf $HOME/.cache/winetricks

RUN true \
    && export WINEARCH=win64 \
    && export WINEPREFIX="$(realpath ~/.wine64)" \
    && entrypoint wineboot --init \
    && winetricks --unattended --force cmd dotnet20 dotnet472 corefonts \
    && while pgrep wineserver >/dev/null; do echo "Waiting for wineserver"; sleep 1; done \
    && rm -rf $HOME/.cache/winetricks

RUN ln -s ~/.wine32 ~/.wine
