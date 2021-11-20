!
! Example:
!   Shows how to use relational operators: `==`, `/=`, `<`, `<=`, `>`, `>=`.
!
program example_relational_operators
    implicit none

    integer, parameter :: T = 0., F = 0

    print *, T == F
    print *, T /= F
    print *, T < F, T <=F
    print *, T > F, T >= F

end program
