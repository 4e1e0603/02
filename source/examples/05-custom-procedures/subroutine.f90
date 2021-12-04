
    subroutine print_scalar(scalar)
        implicit none

        real, intent(in) :: scalar

        print *, scalar

    end subroutine


    subroutine print_vector(vector)
        implicit none

        real, dimension(:), intent(in) :: vector

    end subroutine

    subroutine print_matrix(matrix)
        implicit none

        real, dimension(:,:), intent(in) :: matrix

        print *, matrix

    end subroutine


program example_subroutine
    implicit none

    real :: scalar
    real :: vector(1:5)

    scalar = 1
    print *, scalar

    vector = (/1, 2, 3, 4, 5/)
    print *, vector

end program