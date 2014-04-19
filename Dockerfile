FROM sebgod/mercury-common:latest
MAINTAINER Sebastian Godelet <sebastian.godelet+github@gmail.com>
ENV MERCURY_STABLE_VERSION rotd-2014-04-01
WORKDIR /
RUN mkdir -p stable
WORKDIR stable
RUN wget -N http://dl.mercurylang.org/rotd/mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz
RUN tar xf mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz && mv mercury-srcdist-${MERCURY_STABLE_VERSION} src-stable
WORKDIR src-stable
RUN ./configure --enable-java-grade --enable-csharp-grade
RUN make MMAKEFLAGS=${PARALLEL}
RUN make tags
RUN make MMAKEFLAGS=${PARALLEL} install
ENV PATH /usr/local/mercury-${MERCURY_STABLE_VERSION}/bin:$PATH_ORIG
