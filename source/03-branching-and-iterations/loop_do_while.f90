! -*- coding: utf-8 -*-
!
! Example: Iteration with `do-while` loop.
!
! The example shows the simple `while` loop with incrementing a variable.
! Run 10 iterations and increment the `counter` variable.
!
program example_do_while_loop

    implicit none

    integer :: counter
    integer, parameter :: stop = 10, increment = 1

    do while (counter < stop)
        print '("counter = " (i0) " + " (i0) " = " (i0))', &
            counter, increment, (counter + increment)
        counter = counter + increment
    end do

end program

! (12) What is a default value of declared variable? The answer is 0 for `gfortran`
!      on Windows, but is it save to not set avalue?
! (13) We can declare and define varibales on one line.
! (16) We can split long line with `&` character at the end of the line.
