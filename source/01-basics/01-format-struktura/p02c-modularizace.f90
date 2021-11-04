! Struktura zdrojoveho textu: modularizace

! programova jednotka modul
module m
implicit none ! plati pro cely modul

contains

! modulova funkce
real function f1(x)
real x
f1=x
end function

function f2(x) result (f)
real f,x
f=x
end function

! modulovy podprogram
subroutine s(x)
real x
print *,x
end subroutine

end module

! hlavni program
program p02
use m         ! pripojeni modulu
implicit none
integer i
! real f1,f2  ! chybny duplicitni popis jmen z pripojeneho modulu
i=1
print *,i
print *,f1(0.)
print *,f2(1.)
call s(0.)
call s(1.)
end program
