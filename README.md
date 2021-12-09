# Programming in *modern* Fortran

![Fortran](https://img.shields.io/badge/Language-Fortran-darkviolet.svg)

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
- The codes based on lectures are in `codes` directory.
- The codes created on practicals are located in `codes/practicals` directory.

## Build

At this moment, compile each example as

    gfortran source/<file_name.f90> -o build/<file_name>

We are working on Make/CMake support.

To compile a module as an object use

    gfortran -c path/to/module_name.f90 -o module_name

To compile program and link object as an executable use

    gfortran path/to/program path/to/object -o program_name

## Manage

We use Python 3.5+.

    python manage.py index   # works
    python manage.py clean   # works
    python manage.py release # todo

## Resources

- https://fortran-lang.org/
- https://fortran-lang.discourse.group/

## Zen of Fortran

> Fast is better than slow
> Slow is better than unmaintainable
> Array-oriented is better than object-oriented
> Make everything as simple as possible – but no simpler (Einstein)
> Simplicity is robustness.
> Make it look like the math.
> All inputs and outputs explicit.
> All inputs and outputs carefully named and clearly defined – the
> closer to the point of declaration the better.
> Vector is better than loop
> Matrix is better than vector
> Unless it’s complicated
> Strided is better than scattered
> Contiguous is better than strided
> Broadcasting is a great idea – use where possible
