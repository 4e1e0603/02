! -*- coding: utf-8 -*-

! Example Arrays
!

program array_2d_declaration
    implicit none

    integer :: array(5, 5)  ! 2D pole o 25 prvcích.
    integer :: A(5, 5)

    ! integer array(-5:5,10)
    print *, array
    print *, array(:,1)  ! Print out the first column in a 2D array

    ! Matrix !
    A(2, (2, /1, 3, 5/))
    print *, A

end
