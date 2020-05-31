ARG image_prefix=ncpaprop-


FROM alpine:3.11

RUN adduser -D builder
RUN mkdir /code
RUN chown -c builder:builder /code

USER builder

ADD --chown=builder:builder petsc.tar.gz /code/
RUN mv -v /code/petsc*/ /code/petsc
