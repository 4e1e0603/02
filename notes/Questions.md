# Questions/Answers

Jaký je rozdíl mezi zápisem / který způsob se preferuje a proč?

    integer :: array(10)
    integer, dimension(10) :: array

    integer, dimesion(10) :: array1, array2

    integer :: array(10, 10)
    integer, dimension(10, 10) :: array

Jak nastavit vlastní rozsah pole?

    ! 1D
    integer array(0:9)
    integer array(-5:5)

    ! 2D (pozor včetně nula)
    integer array(-5:5,10)


Jaké hodnoty mají proměnné, které nebyli inicalizovány?

    ! Note: The `i` variable was not set to any value, the 0 was set implicitly by compiler.
    ! gfortran provides some options for this. Integers can be intialized with -finit-integer=n where n is an integer.
    ! For real numbers you can use -finit-real=<zero|inf|-inf|nan|snan>.
    ! Together with -ffpe-trap=denormal this can be very helpful, to get uninitialized reals.