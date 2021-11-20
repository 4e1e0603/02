!! -*- coding: utf-8 -*-

!!
!! Converts the temarature between celsius, fahrenheit and kelvines.
!!
!! C -> F, F -> C, K -> C, C -> K, F -> K, K -> F
!!
module temperature_conversion

    implicit none

    elemental function fahrenheit_to_celsius(temperature) result(outputs)
        real, intent(in) :: temperature
        real             :: outputs
        outputs = (5.0 * (tenmperature - 32.0)) / 9.0
    end function

end module


program temperature_conversion_main

    use temperature_conversion, only: fahrenheit_to_celsius

    implicit none

    real :: degrees_f, degrees_c

    print *, fahrenheit_to_celsius(77.0)

end program