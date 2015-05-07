FROM sebgod/mercury-bootstrap:latest
MAINTAINER Sebastian Godelet <sebastian.godelet@outlook.com>
ENV MERCURY_STABLE_VERSION 14.01.1
ENV MERCURY_STABLE_TARGZ mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz
ADD $MERCURY_RELEASE_URL/$MERCURY_STABLE_TARGZ /tmp/tarballs/
ENV MERCURY_STABLE_PREFIX /usr/local/mercury-stable
ENV PATH ${MERCURY_STABLE_PREFIX}/bin:$PATH_ORIG
WORKDIR /tmp/mercury
RUN tar --strip 1 -x -v -f /tmp/tarballs/$MERCURY_STABLE_TARGZ \
    && aclocal -I m4 \
    && autoconf \
    && sh configure --enable-libgrades=asm_fast.gc \
        --disable-symlinks \
        --with-default-grade=asm_fast.gc \
        --enable-new-mercuryfile-struct \
        --prefix=$MERCURY_STABLE_PREFIX \
    && make \
    && make install \
    && rm -fR *
ENTRYPOINT ["mmc"]
