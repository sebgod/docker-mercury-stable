FROM sebgod/mercury-deps:latest
MAINTAINER Sebastian Godelet <sebastian.godelet+github@gmail.com>
ENV MERCURY_STABLE_VERSION rotd-2014-04-01
WORKDIR /
RUN mkdir -p stable
WORKDIR stable
RUN curl -s -L http://dl.mercurylang.org/rotd/mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz | tar xz
RUN ls -la
RUN cd mercury-srcdist-${MERCURY_STABLE_VERSION} && sh configure --enable-csharp-grade --enable-erlang-grade --enable-java-grade
RUN cd mercury-srcdist-${MERCURY_STABLE_VERSION} && make MMAKEFLAGS=${PARALLEL}
RUN cd mercury-srcdist-${MERCURY_STABLE_VERSION} && make MMAKEFLAGS=${PARALLEL} install
ENV PATH /usr/local/mercury-${MERCURY_STABLE_VERSION}/bin:$PATH_ORIG
