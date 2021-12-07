!
! Arrays
!
program array_01
    implicit none

    real :: vector(3)    ! Declare 1D mutable array of reals of size 5.
    real :: matrix(3,3)  ! Declare 2D mutable array of reals of size 5x5.
    integer :: i, j

    ! Assign the vector values.
    do i = 1,3
        vector(i) = i * 2.0
    end do

    ! Display the vector values.
    do i = 1,3
        print *, vector(i)
    end do

    ! Assign the matrix values.
    do i = 1,3
        do j = 1,3
            matrix(i, j) = i + j
        end do
    end do

    ! Display the matrix values.
    do i = 1,3
        do j = 1,3
            print *, matrix(i,j)
        end do
    end do

    ! The short-hand assignment.
    vector = (/1.0, 2.0, 3.0/)

    print *, "---"
    do i = 1,3
        print *, vector(i)
    end do

end program array_01