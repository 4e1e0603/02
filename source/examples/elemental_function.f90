! Elemental fucntions and functional programming.
!
! gfortran.exe  -std=f2018 .\source\examples\elemental_function.f90

program elemental_functions

    print *, square(2.)

    print *, square([1., 2.])

    print *, square([ [1., 2.], [3., 4.] ])

    print *, "Fibonacci single values"    , fibonacci (0), fibonacci(1), fibonacci(2), fibonacci(3), fibonacci(4)
    print *, "Fibonacci multiple values:" , fibonacci([0,            1,            2,            3,            4])

contains

    pure elemental real function square(x)
        real, intent (in) :: x
        square = x ** 2
    end

    ! Note: proor to Fortran 2018 the elemental function could not be
    ! both elemental and recursive.
    ! Are elemental procedures pure by default?

    ! Elemental version of Fibonacci's sequence.
    !
    ! Calling `fibonacci(n)` calculates a single `n`-th Fibonacci's number.
    ! Calling `fibonacci([1...n])` calculates a Fibonacci's series up to `n`.
    !
    pure elemental integer function fibonacci(n) result(b)
        integer, intent(in) :: n
        integer :: i, a

        a = 1; b = 1

        select case (n)
            case (0:2)
                b = n
            case default
                do i = 1, n
                    a = b
                    b = a + b
                end do
        end select
    end function

end program
