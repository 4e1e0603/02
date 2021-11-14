!
! Dynamické pole
!
program array_03
    implicit none

    ! Deklarace ukazatelového pole.
    real, pointer :: p(:) ! Počet dimenzí musí být dán předem.
    real, pointer :: r(:)

    allocate(p(3))        ! Rozhodneme se jak bude pole velké.
    p = 1.0               ! Všem prvkům přiřadím stejný skalár.

    r => p                ! Kopírování dat do `r`? protože jsem nealokoval,
    ! tak Fortran udělá automatcikou alokaci? U Ukazatelových polí není.
    ! p = 2.0

    print *, p
    print *, r
    print *, "---"

    allocate(r(3))
    r = p
    p = 2.0
    print *, p
    print *, r
    print *, "---"

end program array_03