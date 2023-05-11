! -*- coding: utf-8 -*-

!!
!! Example: Show the nested loop construct.
!!
program example_nested_loops_1
    implicit none

    integer :: i, j

    do i = 1, 3
        do j = 1, 2
            print *, i, j
        end do
    end do

end program