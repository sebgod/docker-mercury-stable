FROM sebgod/mercury-bootstrap:latest
MAINTAINER Sebastian Godelet <sebastian.godelet+github@gmail.com>
ENV MERCURY_PREFIX rotd
ENV MERCURY_STABLE_VERSION rotd-2014-04-01
RUN ( curl -s -L http://dl.mercurylang.org/${MERCURY_PREFIX}/mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz | tar xz --strip 1 ) && sh configure --enable-csharp-grade --enable-erlang-grade --enable-java-grade && make MMAKEFLAGS=${PARALLEL} && make MMAKEFLAGS=${PARALLEL} install
ENV PATH /usr/local/mercury-${MERCURY_STABLE_VERSION}/bin:$PATH_ORIG
