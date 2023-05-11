FROM ubuntu:latest

LABEL author="David Landa"

RUN apt-get update
RUN apt-get -y install build-essential gfortran

COPY example.f90 /fortran/

WORKDIR /fortran/

RUN gfortran -std=f2018 example.f90 -o example

CMD ["./example"]