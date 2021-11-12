! -*- coding: utf-8 -*-
!
! Example: Iteration with `do` loop.
!
! The example shows the simple `do` loop with printing a variable's value.
!
program example_do_loop

    implicit none

    integer :: counter

    do counter = 1, 10
        print '("counter = " (i0))', counter
    end do

end program
