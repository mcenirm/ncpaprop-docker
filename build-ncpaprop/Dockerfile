ARG image_prefix=ncpaprop-


FROM ${image_prefix}petsc

USER root
RUN apk update
RUN apk add fftw-dev fftw fftw-double-libs fftw-long-double-libs fftw-single-libs
RUN apk add gsl-dev gsl-static gsl
RUN apk add git
RUN apk add perl

ADD --chown=builder:builder ncpaprop.tar.gz /code/
RUN mv -v /code/ncpaprop*/ /code/ncpaprop
RUN chown -R builder:builder /code/ncpaprop

USER builder
WORKDIR /code/ncpaprop
RUN ./configure \
    PETSC_DIR=/code/petsc \
    PETSC_ARCH_REAL=arch-linux-c-real \
    PETSC_ARCH_COMPLEX=arch-linux-c-complex \
    --with-localslepc \
    || tail -v config.log
