!
! Example: Show how to use simple `if` statment.
!
program example_if_statement
    implicit none

    integer :: counter = 0

    if (counter == 0) then
        counter = counter + 1  ! Increments the counter's value.
        print *, counter
    end if

    if (counter /= 0) then
        print *, counter
        print *, counter
    end if

end program