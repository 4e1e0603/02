!
! Example: Shows the basic arthemtics with number.
!
program example_arithmetic_operators
    implicit none

    integer :: a = 10, b = 5

    ! + addition
    print *, a + b ! => integer

    ! - subtraction
    print *, a - b  ! => integer

    ! - multiplication
    print *, a * b  ! => integer

    ! / division
    print *, a / b  ! => real

    ! incrementation/decrementation
    ! Fortran ha no `+=` or `++` operators as C/C++ etc.
    a = a + 1
    b = b - 1

    print *, a
    print *, b

end program