ARG image_prefix=ncpaprop-


FROM alpine:3.11

RUN apk update
RUN apk add build-base
RUN apk add bash
RUN apk add python3
RUN ln -s python3 /usr/bin/python

RUN adduser -D builder
RUN mkdir /code
RUN chown -c builder:builder /code

USER builder

ADD --chown=builder:builder petsc.tar.gz /code/
RUN mv -v /code/petsc*/ /code/petsc
COPY --chown=builder:builder build-with-scalar-type.bash /tmp/

WORKDIR /code/petsc/
RUN bash /tmp/build-with-scalar-type.bash real
RUN bash /tmp/build-with-scalar-type.bash complex

RUN rm /tmp/build-with-scalar-type.bash
