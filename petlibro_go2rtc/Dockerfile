ARG BUILD_FROM=alpine:3.20
FROM ${BUILD_FROM}
ARG BUILD_ARCH=amd64
ARG G2R_VERSION=v1.9.14-petlibro.3
RUN apk add --no-cache jq curl \
 && case "${BUILD_ARCH}" in \
      amd64)   BIN=petlibro-go2rtc_linux_amd64; SHA=15c9ef0cff99f5857ff602e9dee40ed59212d9e5af351dbac8596a80aa8e4ddb ;; \
      aarch64) BIN=petlibro-go2rtc_linux_arm64; SHA=a9128486ee1c53fe27341430446fca444ba16db50ea1ebab5ba5650f42800ccf ;; \
      armv7)   BIN=petlibro-go2rtc_linux_armv7; SHA=9a0ac2a3d21e33c99d30709c7cc007a3674e871b04387f7e0f313278238d09fe ;; \
      *) echo "unsupported arch ${BUILD_ARCH}"; exit 1 ;; \
    esac \
 && curl -fsSL -o /usr/local/bin/go2rtc "https://github.com/tannerln7/go2rtc/releases/download/${G2R_VERSION}/${BIN}" \
 && echo "${SHA}  /usr/local/bin/go2rtc" | sha256sum -c - \
 && chmod +x /usr/local/bin/go2rtc \
 && apk del curl
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]
