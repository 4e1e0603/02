! Struktura zdrojoveho textu: vnorovani programovych jednotek

! hlavni program
program p02
implicit none
integer i
! real f1,f2  ! chybny duplicitni popis vnorenych funkci
i=1
print *,i
print *,f1(0.)
print *,f2(1.)
call s(0.)
call s(1.)

contains ! uvozovaci popis vnorenych programovych jednotek

! vnorena funkce
real function f1(x)
implicit none
real x
f1=x
end function

function f2(x) result (f)
implicit none
real f,x
f=x
end function

! vnoreny podprogram
subroutine s(x)
implicit none
real x
print *,x
end subroutine

end program
