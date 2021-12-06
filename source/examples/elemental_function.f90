! Elemental fucntions and functional programming.
!
! gfortran.exe  -std=f2018 .\source\examples\elemental_function.f90

program elemental_functions

    print *, square(2.)

    print *, square([1., 2.])

    print *, square([ [1., 2.], [3., 4.] ])

    print *, fibonacci(0), fibonacci(1), fibonacci(2), fibonacci(3), fibonacci(4)

    ! print *, fibonacci(0, 1, 2, 3, 4)

contains

    pure elemental real function square(x)
        real, intent (in) :: x
        square = x ** 2
    end

    ! Note: proor to Fortran 2018 the elemental function cpild not be
    ! both elemental and recursive

    pure recursive integer function fibonacci(n) result(output)
        integer, intent (in) :: n
        if ( (n == 0) .or. (n == 1)) then
            output = n
        else
            reuslt = fibonacci(n - 1) + fibonacci(n - 2)
        end if
    end

end