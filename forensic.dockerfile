# Author: The Exegol Project

FROM debian:11-slim

ARG TAG="local"
ARG VERSION="local"
ARG BUILD_DATE="n/a"

LABEL org.exegol.tag="${TAG}"
LABEL org.exegol.version="${VERSION}"
LABEL org.exegol.build_date="${BUILD_DATE}"
LABEL org.exegol.app="Exegol"
LABEL org.exegol.src_repository="https://github.com/ThePorgs/Exegol-images"

COPY sources /root/sources/

WORKDIR /root/sources/install

RUN echo "${TAG}-${VERSION}" > /opt/.exegol_version && \
    chmod +x entrypoint.sh && \
    ./entrypoint.sh package_base && \
    ./entrypoint.sh package_forensic

WORKDIR /workspace

ENTRYPOINT ["/.exegol/entrypoint.sh"]