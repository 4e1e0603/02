program example_02_variable
    implicit none

    integer :: i
    real :: r
    complex :: c
    character :: s
    logical :: b


    i = 1
    r = 1.0
    c = (1.0, -0.5)
    s = 'A'
    b = .false.

    print *, i
    print *, r
    print *, c
    print *, s
    print *, b

end program example_02_variable
