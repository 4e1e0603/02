!
! Example: Shows how to compute Fibonacci's number.
!
module fibonacci

    contains

    function fibonacci_iterative(n) result(output)
        !! Calculate the n-th Fibonacci's number (iterative version).
        !! TODO Check n >= 0.
        implicit none

        integer, intent(in) :: n
        integer :: output

        ! TODO
        output = -1

    end function

    recursive function fibonacci_recursive(n) result(output)
        !! Calculate the n-th Fibonacci's number (recursive version).
        !! TODO Check n >= 0.
        implicit none

        integer, intent(in) :: n
        integer :: output

        ! TODO
        output = -1

    end function

    end module

    program example_fibonacci_iterative

        use fibonacci, only: fibonacci_iterative, fibonacci_recursive

        implicit none

        print *, "iterative version"
        print '(i0)', fibonacci_iterative(1)
        print '(i0)', fibonacci_iterative(2)
        print '(i0)', fibonacci_iterative(3)
        print '(i0)', fibonacci_iterative(4)
        print '(i0)', fibonacci_iterative(5)

        print *, "recursive version"
        print '(i0)', fibonacci_recursive(1)
        print '(i0)', fibonacci_recursive(2)
        print '(i0)', fibonacci_recursive(3)
        print '(i0)', fibonacci_recursive(4)
        print '(i0)', fibonacci_recursive(5)

    end program