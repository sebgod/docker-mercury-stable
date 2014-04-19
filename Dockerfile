FROM sebgod/mercury-deps:latest
MAINTAINER Sebastian Godelet <sebastian.godelet+github@gmail.com>
RUN apt-get install -y curl
ENV MERCURY_STABLE_VERSION rotd-2014-04-01
WORKDIR /
RUN mkdir -p stable
WORKDIR stable
RUN curl -L http://dl.mercurylang.org/rotd/mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz | tar xz
RUN mv mercury-srcdist-${MERCURY_STABLE_VERSION} src-stable
WORKDIR src-stable
RUN sh configure --enable-java-grade --enable-csharp-grade --enable-erlang-grade
RUN make MMAKEFLAGS=${PARALLEL}
RUN make tags
RUN make MMAKEFLAGS=${PARALLEL} install
ENV PATH /usr/local/mercury-${MERCURY_STABLE_VERSION}/bin:$PATH_ORIG
