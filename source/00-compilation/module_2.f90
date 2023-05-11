!
! The Fortran module.
!
module module_2

    implicit none

    private

    public :: hello

    contains

    subroutine hello()
        print *, "Hello from module B"
    end subroutine

end module