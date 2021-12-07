! Pozoor v n může být buď maximální hodnota nebo o jedna větši
! platnost indexu je i za smyčkou

module mandelbrot_m
    implicit none

    contains

    elemental function mandelbrot(c) result (nstop)
        implicit none
        integer :: nstop
        complex :: c
    end function

end module

program mandelbrot
    implicit none
end program mandelbrot