# Programming in Fortran

- The notes from lectures are in `notes` directory.
- The codes based on lectures are in `source` directory.
- The codes created on practicals are located in `practicals` directory.

## Build

At this moment, you can manually compile each example as

    gfortran source/<file_name.f90> -o build/<file_name>

We are working on Make/CMake support.

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
