!
! Example: Shows how to compute factorials.
!
module factorial

contains

function factorial_iterative(n) result(output)
    !! Calculate the factorial of number `n` (iterative version).
    !! TODO Check n >= 0.
    implicit none

    integer, intent(in) :: n
    integer :: output, current

    output = 1; current = 1

    do while (current <= n)
        output = output * current
        current = current + 1
    end do

end function

recursive function factorial_recursive(n) result(output)
    !! Calculate the factorial of number `n` (recursive version).
    !! TODO Check n >= 0.
    implicit none

    integer, intent(in) :: n
    integer :: output

    if (n == 0) then
        output = 1
    else
        output = n * factorial_recursive(n - 1)
    end if

end function

end module

program example_factorial_iterative

    use factorial, only: factorial_iterative, factorial_recursive

    implicit none

    print *, "iterative version"
    print '(i0)',  factorial_iterative(1)
    print '(i0)',  factorial_iterative(2)
    print '(i0)',  factorial_iterative(3)
    print '(i0)',  factorial_iterative(4)
    print '(i0)',  factorial_iterative(5)

    print *, "recursive version"
    print '(i0)',  factorial_recursive(1)
    print '(i0)',  factorial_recursive(2)
    print '(i0)',  factorial_recursive(3)
    print '(i0)',  factorial_recursive(4)
    print '(i0)',  factorial_recursive(5)

end program