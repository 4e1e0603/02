# Fortran & Docker

This example shows how to compile and run Fortran program inside Docker container.

Go to folder

```shell
cd /path/to/XX_example
```

build the image

```shell
docker build -t exampleXX  .
```

run the container

``shell
docker run exampleXX
```

where `XX` is the number e.g `01` etc.


Working with intel fortran compiler in Docker:

    docker pull intel/oneapi-hpckit
    docker run -it intel/oneapi-hpckit -name firstcontainer

See https://andreamoro.net/docker-fortran.html
