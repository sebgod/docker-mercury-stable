# vim: ft=dockerfile tw=78 ts=4 sw=4 et
FROM sebgod/mercury-bootstrap:latest
MAINTAINER Sebastian Godelet <sebastian.godelet@outlook.com>
ENV MERCURY_STABLE_VERSION 14.01.1
ENV MERCURY_STABLE_TARGZ mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz
ADD $MERCURY_RELEASE_URL/$MERCURY_STABLE_TARGZ $MERCURY_TMP/tarballs/
ENV MERCURY_STABLE_PREFIX /usr/local/mercury-stable
ENV PATH ${MERCURY_STABLE_PREFIX}/bin:$PATH_ORIG
WORKDIR $MERCURY_TMP/mercury
RUN tar --strip 1 -x -f $MERCURY_TMP/tarballs/$MERCURY_STABLE_TARGZ \
    && aclocal -I m4    \
    && autoconf         \
    && (sh configure     \
            --enable-libgrades=asm_fast.gc      \
            --with-default-grade=asm_fast.gc    \
            --enable-new-mercuryfile-struct     \
            --prefix=$MERCURY_STABLE_PREFIX > build.log \
        && make >> build.log \
        && make install >> build.log \
        && rm -fR * \
        ) || (cat build.log & false)
ENTRYPOINT ["mmc"]
