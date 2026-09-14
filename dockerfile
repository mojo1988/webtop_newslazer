FROM lscr.io/linuxserver/webtop:ubuntu-xfce

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    libgl1 \
    libgl1-mesa-dri \
    && rm -rf /var/lib/apt/lists/*

COPY newslazer_x64_installer.run /tmp/newslazer_x64_installer.run

# AppImage ohne FUSE entpacken und an einen Zielort verschieben (z.B. /opt/newslazer)
RUN chmod +x /tmp/newslazer_x64_installer.run \
    && cd /tmp && ./newslazer_x64_installer.run --appimage-extract \
    && mv /tmp/squashfs-root /opt/newslazer \
    && rm /tmp/newslazer_x64_installer.run

