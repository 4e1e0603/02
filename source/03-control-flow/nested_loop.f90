!!
!! Example: Show the nested loop construct.
!!
program example_one_nested_loop
    implicit none

    integer :: i, j

    do i = 1, 3
        do j = 1, 3
            print *, i, j
        end do
    end do

end program example_one_nested_loop