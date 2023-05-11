! Použití konstaty a subrutiny uložené v modulu.

module constants

    implicit none

    real(kind=8), parameter :: PI = 3.1415926536

    contains

    subroutine print_contants()
        print *, 'Výpis z podprogramu: PI = ', PI, '.'
    end subroutine

end module constants


program numbers

    use constants

    implicit none

    call print_contants()

    print *, 'Výpis z hlavního programu: PI = ', PI, '.'

end program numbers