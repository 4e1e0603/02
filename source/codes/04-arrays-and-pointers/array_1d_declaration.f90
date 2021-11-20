! -*- coding: utf-8 -*-

! Example Arrays
!

program array_1d_declaration
    implicit none

    integer :: i
    integer :: array(10)  ! Deklarujeme 1D pole o 10 prvcích.

    ! real a, allocatable :: a(:) !
    ! a = [(real(i), i = 1, 3)] aplikace na skalár
    ! a = real([i, i=1,3]) apliakce na celé pole

    ! print *, (i, i = 1,10) vždy bylo ve fortranu
    ! print *, [(i, i = 1,10)] přidáno
    ! a = -a

    print *, "[1]"
    print *, array ! Pole není inicializované => obsahem může být cokoliv.

    print *, "[2]"
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print *, array

    print *, "[3]"
    array = [(i, i = 1, 10)] ! Inicializace pomocí cyklu.
    print *, array

    print *, "[4]"
    array(:) = 0   ! Nastav všechny prvku na hodnotu 0.
    print *, array ! Srovnej s Pythonem `list[:]`.

    print *, "[5]"
    array(1:5) = 1 ! Nastav prvních pět prvků na hodnotu 1
    print *, array ! (od indexu 1 do indexu 5 včetně).

    print *, "[6]"
    array(6:) = 2  ! Nastav posledních pět prvků na hodnotu 2
    print *, array ! (od indexu 6 do indexu 10 včetně).

    print *, "[7]"
    print *, array(10:1:-1)  ! Vypiš pole vobráceném pořadí

    print *, "[8]"
    print *, array(10:1:-1)  ! Vypiš pole vobráceném pořadí

    array = [(i, i = 1, 10)]

    print *, "[9]"
    print *, array(1:10:2)   ! Vypiš hodnoty na lichých pozicích.

end program
