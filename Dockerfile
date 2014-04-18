FROM sebgod/mercury-common:latest
MAINTAINER Sebastian Godelet <sebastian.godelet+github@gmail.com>
WORKDIR /src
RUN ./configure --enable-java-grade --enable-csharp-grade
RUN make MMAKEFLAGS=${PARALLEL}
RUN make tags
RUN make MMAKEFLAGS=${PARALLEL} install
# ENV PATH /usr/local/mercury-DEV/bin:$PATH_ORIG
