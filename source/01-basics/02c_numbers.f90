! Program s ukázkou deklarace proměnných základních číselnýh datových
! typů a operací s nimi. Vypíše výstup do standardního výstupu tj. konzole.

program numbers

    implicit none

    ! Deklarace proměnných případně konstant.
    real(kind=8) :: r, area
    real(kind=8), parameter :: PI = 3.1428_8

    r = 1._8

    area = PI * r ** 2

    print *, 'Obsah hkruhu je  ', area

end program numbers