! -*- coding: utf-8 -*-

!!
!! Example: Show the nested loop construct.
!!
program example_nested_loops_2
    implicit none

    integer :: i, j, k

    do i = 1, 4
        do j = 1, 3
            do = 1, 2
            print *, i, j, k
        end do
    end do

end program