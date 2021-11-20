!
! Ukazatele
!
!
program lecture_04
    implicit none

    ! Pojmenovaný
    ! real, pointer :: p,r
    ! real, target :: x = 1
    ! p => x
    ! r => x

    ! print *, p
    ! ---------------------------------------
    ! Dynamická alokace: nepojmenovaný cíl
    ! ---------------------------------------

    ! Deklarace ukazatele na skalár s inicializací na null.
    ! ideální je ukazatel inicializovat na `NULL`
    ! (4 bytes)
    real, pointer :: p => null(), r => null()

    ! Vytvoříme nepojmenovaný cíl a ukazatel zaměříme na cíl.
    allocate (p)

    ! Nyní můžeme do cíle něco přiřadit

    if (associated(p)) then
        print *, p
    end if

    ! (3) Dangling pointer
    ! -----------------------------------------------------
    ! allocate(p)
    ! p = 1.
    ! r => p
    ! print *, p, r
    ! deallocate(p)
    ! print *, r associated(r)

    ! (4) Double free
    ! allocate(p)
    ! p = 1.
    ! r => p



end program lecture_04