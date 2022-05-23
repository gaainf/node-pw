# Build base image
ARG VERSION=16-bullseye-slim
FROM node:${VERSION} AS base

RUN mkdir -p /usr/src/app
RUN chmod -R 777 /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get install -y wget gnupg ca-certificates procps libxss1
# RUN RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
#     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# RUN apt-get install -y chromium libwebkit2gtk-4.0-dev

RUN apt-get update \
    && apt-get install -y libgbm-dev libxkbcommon-x11-0 libgtk-3-0 libevent-dev libdbus-glib-1-2

RUN apt-get update \
    && apt-get install -y aspell-en hunspell-uk libc-bin libglib2.0-0

COPY platform_dependent_packages.sh /platform_dependent_packages.sh
RUN /platform_dependent_packages.sh
RUN rm -rf *.deb

RUN apt-get update && apt-get install -y fonts-ipafont-gothic fonts-liberation fonts-noto-color-emoji \
    fonts-tlwg-loma-otf fonts-wqy-zenhei gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libbrotli1 \
    libcairo2 libcups2 libdbus-1-3 libdrm2 libegl1 libenchant1c2a libepoxy0 libevdev2 libfontconfig \
    libfontconfig1 libfreetype6 libgbm1 libgdk-pixbuf2.0-0 libgl1 libgles2 \
    libgstreamer-gl1.0-0 libgstreamer1.0-0 libgtk-3-0 libharfbuzz-icu0 libharfbuzz0b libhyphen0 \
    libjpeg-turbo8 libnotify4 libnspr4 libnss3 libopenjp2-7 libopus0 libpango-1.0-0 \
    libpng16-16 libsecret-1-0 libvpx5 libwayland-client0 libwayland-egl1 libwayland-server0 \
    libwebp6 libwebpdemux2 libwoff1 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxdamage1 \
    libxext6 libxfixes3 libxkbcommon0 libxml2 libxrandr2 libxshmfence1 libxslt1.1 \
    ttf-ubuntu-font-family ttf-unifont xfonts-cyrillic xfonts-scalable xvfb libopengl0

ARG NODE_OPTIONS=--max_old_space_size=8192
ENV NODE_OPTIONS=${NODE_OPTIONS}

RUN mkdir -p /pw-browsers
RUN chmod 777 /pw-browsers
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=true
ENV PLAYWRIGHT_BROWSERS_PATH=/pw-browsers

# Configure kernel to avoid no-sanbox error
RUN echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/userns.conf

RUN apt-get update && apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ARG USERNAME=appuser
ENV USERNAME=${USERNAME}
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd -f -g ${USER_UID} ${USER_UID}
RUN useradd -o -u ${USER_UID} -g ${USER_UID} -s /bin/bash -m ${USERNAME}
    
# Add sudo support
RUN apt-get update \
    && apt-get install -y sudo \
    && sudo passwd -d root \
    && echo "root ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}

RUN npm install --no-save playwright-core
RUN npx playwright install chromium
RUN npx playwright install webkit
RUN npx playwright install firefox
RUN rm -rf ./node_modules

ENTRYPOINT ["/bin/bash"]
