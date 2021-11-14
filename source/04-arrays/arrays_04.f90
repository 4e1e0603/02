!
! Dynamické pole
! alokovatelná pole
program array_03
    implicit none

    ! Deklarace ukazatelového pole.
    real, allocatable :: p(:) ! Počet dimenzí musí být dán předem.
    real, allocatable :: r(:)
    integer ierr

    allocate(p(3))  ! Rozhodneme se jak bude pole velké.
    p = 1.0         ! Všem prvkům přiřadím stejný skalár.

    r = p           ! Kopírování dat do `r`? protože jsem nealokoval,
                    ! tak Fortran udělá automatcikou alokaci? U Ukazatelových polí není.
    p = 2.0
    print *, "p"
    deallocate(r)

    ! allocate(r(3))
    ! allocate(r(size(p)))
    ! print *, "r", r

    allocate(r, mold=p)
    ! r je neinicializované,
    print *, "r", r
    deallocate(r)

    allocate(r, source=p)
    print *, "r", r

    if (.not.allocated(r)) allocate(r, source=p)
    ! Pokud při alokaci dojde k chybě, tak se do `ierr` zapíše chybový kód.
    allocate(r, source=p, stat=ierr)

    print *, 'ierr = ', ierr

end program array_03
