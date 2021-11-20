!
! Arrays
!
program array_02
    implicit none

    real, dimension(3) :: vector
    real, dimension(3,3) :: matrix

    ! We can fill the array with `array(index) = value`.
    vector(1) = 1.0
    vector(2) = 2.0
    vector(3) = 3.0

    call show_vector_3(vector)

    call fill_vector_3(vector)
    call show_vector_3(vector)

    matrix(1,1) = 1.1
    matrix(1,2) = 1.2
    matrix(1,3) = 1.3

    matrix(2,1) = 2.1
    matrix(2,2) = 2.2
    matrix(2,3) = 2.2

    matrix(3,1) = 3.1
    matrix(3,2) = 3.2
    matrix(3,3) = 2.3

    ! call fill_matrix_3x3(matrix)
    ! call show_matrix_3x3(matrix)

end program array_02

! Fill the passed 1D array with values.
subroutine fill_vector_3(v)
    implicit none

    real, dimension(3), intent (out) :: v
    integer :: i
    do i = 1,3
        v(i) = i * i
    end do

end subroutine fill_vector_3

! Show the values of passed 1D array.
subroutine show_vector_3(v)
    real, dimension(3) :: v
    integer :: i

    do i = 1,3
     print *, v(i)
    end do

end subroutine show_vector_3


! subroutine fill_matrix_3x3(m)
!     implicit none

!     real, dimension(3,3) intent (out) :: m
!     integer :: i, j
!     do i = 1,3
!         do j = 1,3
!             m(i,j) = i * j
!         end do
!     end do

! end subroutine fill_matrix_3x3
