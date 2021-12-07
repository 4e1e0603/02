!
! The Fortran module.
!
module module_1

    implicit none

    private

    public:: hello

    contains

    subroutine hello()
        print *, "Hello from module A"
    end subroutine

end module