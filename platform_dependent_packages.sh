#!/bin/bash

arch=""
case $(uname -m) in
    i386)
        arch="386" ;;
    i686)
        arch="386" ;;
    x86_64)
        arch="amd64"
        echo $arch
        wget http://ftp.de.debian.org/debian/pool/non-free/f/fonts-ubuntu/fonts-ubuntu_0.83-4_all.deb -O fonts-ubuntu_0.83-4_all.deb \
        && dpkg -i fonts-ubuntu_0.83-4_all.deb \
        && wget http://ftp.de.debian.org/debian/pool/non-free/f/fonts-ubuntu/ttf-ubuntu-font-family_0.83-4_all.deb -O ttf-ubuntu-font-family_0.83-4_all.deb \
        && dpkg -i ttf-ubuntu-font-family_0.83-4_all.deb \
        && wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1_amd64.deb -O multiarch-support_2.27-3ubuntu1_amd64.deb \
        && dpkg -i multiarch-support_2.27-3ubuntu1_amd64.deb \
        && wget http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_1.5.2-0ubuntu5_amd64.deb -O libjpeg-turbo8_1.5.2-0ubuntu5_amd64.deb \
        && dpkg -i libjpeg-turbo8_1.5.2-0ubuntu5_amd64.deb \
        && wget http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_amd64.deb -O libjpeg8_8c-2ubuntu8_amd64.deb \
        && dpkg -i libjpeg8_8c-2ubuntu8_amd64.deb \
        && wget http://archive.ubuntu.com/ubuntu/pool/main/h/hunspell/libhunspell-1.6-0_1.6.2-1_amd64.deb -O libhunspell-1.6-0_1.6.2-1_amd64.deb \
        && dpkg -i libhunspell-1.6-0_1.6.2-1_amd64.deb \
        && wget http://archive.ubuntu.com/ubuntu/pool/main/e/enchant/libenchant1c2a_1.6.0-11.1_amd64.deb -O libenchant1c2a_1.6.0-11.1_amd64.deb \
        && dpkg -i libenchant1c2a_1.6.0-11.1_amd64.deb \
        && wget http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu66_66.1-2ubuntu2_amd64.deb -O libicu66_66.1-2ubuntu2_amd64.deb \
        && dpkg -i libicu66_66.1-2ubuntu2_amd64.deb \
        && wget http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu60_60.2-3ubuntu3_amd64.deb -O libicu60_60.2-3ubuntu3_amd64.deb \
        && dpkg -i libicu60_60.2-3ubuntu3_amd64.deb \
        && wget http://ftp.de.debian.org/debian/pool/main/libv/libvpx/libvpx5_1.7.0-3+deb10u1_amd64.deb \
        && dpkg -i libvpx5_1.7.0-3+deb10u1_amd64.deb
        ;;
    aarch64) arch="arm64"
        echo $arch
        wget http://ftp.de.debian.org/debian/pool/non-free/f/fonts-ubuntu/fonts-ubuntu_0.83-4_all.deb -O fonts-ubuntu_0.83-4_all.deb \
        && dpkg -i fonts-ubuntu_0.83-4_all.deb \
        && wget http://ftp.de.debian.org/debian/pool/non-free/f/fonts-ubuntu/ttf-ubuntu-font-family_0.83-4_all.deb -O ttf-ubuntu-font-family_0.83-4_all.deb \
        && dpkg -i ttf-ubuntu-font-family_0.83-4_all.deb \
        && wget http://ports.ubuntu.com/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1_arm64.deb -O multiarch-support_2.27-3ubuntu1_arm64.deb \
        && dpkg -i multiarch-support_2.27-3ubuntu1_arm64.deb \
        && wget http://ports.ubuntu.com/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_1.5.2-0ubuntu5_arm64.deb -O libjpeg-turbo8_1.5.2-0ubuntu5_arm64.deb \
        && dpkg -i libjpeg-turbo8_1.5.2-0ubuntu5_arm64.deb \
        && wget http://ports.ubuntu.com/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_arm64.deb -O libjpeg8_8c-2ubuntu8_arm64.deb \
        && dpkg -i libjpeg8_8c-2ubuntu8_arm64.deb \
        && wget http://ports.ubuntu.com/pool/main/h/hunspell/libhunspell-1.6-0_1.6.2-1_arm64.deb -O libhunspell-1.6-0_1.6.2-1_arm64.deb \
        && dpkg -i libhunspell-1.6-0_1.6.2-1_arm64.deb \
        && wget http://ports.ubuntu.com/pool/main/e/enchant/libenchant1c2a_1.6.0-11.1_arm64.deb -O libenchant1c2a_1.6.0-11.1_arm64.deb \
        && dpkg -i libenchant1c2a_1.6.0-11.1_arm64.deb \
        && wget http://ports.ubuntu.com/pool/main/i/icu/libicu66_66.1-2ubuntu2_arm64.deb -O libicu66_66.1-2ubuntu2_arm64.deb \
        && dpkg -i libicu66_66.1-2ubuntu2_arm64.deb \
        && wget http://ports.ubuntu.com/pool/main/i/icu/libicu60_60.2-3ubuntu3_arm64.deb -O libicu60_60.2-3ubuntu3_arm64.deb \
        && dpkg -i libicu60_60.2-3ubuntu3_arm64.deb \
        && wget http://ftp.de.debian.org/debian/pool/main/libv/libvpx/libvpx5_1.7.0-3+deb10u1_arm64.deb \
        && dpkg -i libvpx5_1.7.0-3+deb10u1_arm64.deb
        ;;
esac