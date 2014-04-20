FROM sebgod/mercury-deps:latest
MAINTAINER Sebastian Godelet <sebastian.godelet+github@gmail.com>
RUN apt-get install -y curl
ENV MERCURY_STABLE_VERSION rotd-2014-04-01
WORKDIR /
RUN mkdir -p stable
WORKDIR stable
RUN curl -s -L http://dl.mercurylang.org/rotd/mercury-srcdist-${MERCURY_STABLE_VERSION}.tar.gz | tar xz
RUN ls -la
# --enable-java-grade is disabled, since it doesn't build on trusted build so far
RUN cd mercury-srcdist-${MERCURY_STABLE_VERSION} && sh configure --enable-csharp-grade --enable-erlang-grade
RUN cd mercury-srcdist-${MERCURY_STABLE_VERSION} && make MMAKEFLAGS=${PARALLEL}
RUN cd mercury-srcdist-${MERCURY_STABLE_VERSION} && make MMAKEFLAGS=${PARALLEL} install
ENV PATH /usr/local/mercury-${MERCURY_STABLE_VERSION}/bin:$PATH_ORIG
