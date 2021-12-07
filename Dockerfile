FROM ubuntu:latest

LABEL author="David Landa"

RUN apt-get update
RUN apt-get -y install build-essential gfortran

COPY Makefile /source/examples/elemental_function.f90 /fortran/
WORKDIR /fortran/
RUN echo `gfortran --version`
RUN gfortran -std=f2018 elemental_function.f90 -o elemental_function

CMD ["./elemental_function"]