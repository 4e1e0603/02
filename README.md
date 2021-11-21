# Programming in modern Fortran

```
                              ______
                             (_) |
                                _|_  __   ,_  _|_  ,_    __,   _  _
                               / | |/  \_/  |  |  /  |  /  |  / |/ |
                              (_/   \__/    |_/|_/   |_/\_/|_/  |  |_/

                               “GOD IS REAL, unless declared INTEGER.”
```

<small>This file is machine-generated. Please, don't edit manually.</small>

- The notes from lectures are in `notes` directory.
- The codes based on lectures are in `source` directory.
- The codes created on practicals are located in `practicals` directory.

## Build

At this moment, compile each example as

    gfortran source/<file_name.f90> -o build/<file_name>

We are working on Make/CMake support.

To compile a module as an object use

    gfortran -c path/to/module_name.f90 -o module_name

To compile program and link object as an executable use

    gfortran path/to/program path/to/object -o program_name

### What to do with `Error in compiling: Can't open module file`?

You have to compile your module first before an executable as an objects or
you can compile them together but there have to be listed first on command line.

    gfortran path/to/module path/to/program  -o program_name
             ^^^^^^^^^^^^^^ See that modules are compile first!

### What are these `.mod` files?

- https://fortranwiki.org/fortran/show/Compiler+.MOD+files

## Manage

We use Python 3.5+.

    python manage.py index   # work-in-progress
    python manage.py clean   # works
    python manage.py release # todo

## Coding style

We do not repeat the program name or procedure after the `end`  unless it is a very long script.

    program program_name
        implicit none       ! always-use-implicit
        ! code !
    end program             ! no-program-name-here

    function function_name
        implicit none
        ! code !
    end function            ! no-function-name-here

    function module_name
        implicit none
        ! code !
    end module              ! no-function-name-here
