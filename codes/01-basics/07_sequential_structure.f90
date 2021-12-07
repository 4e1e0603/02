! Struktura zdrojoveho textu: sekvencni razeni samostatnych programovych jednotek

! hlavni program
PROGRAM p02
! IMPLICIT INTEGER (i-n),REAL (a-h,o-z) ! standardni implicitni jmenna konvence
IMPLICIT NONE  ! zruseni jmenne konvence
INTEGER i
REAL f1,f2
i=1
print *,i      ! vypis integer vyrazu
print *,f1(0.) ! volani funkce, vypis real vyrazu 
print *,f2(1.)
call s(0.)     ! volani podprogramu
call s(1.)
END PROGRAM

! funkce jako samostatna programova jednotka
REAL FUNCTION f1(x)
IMPLICIT NONE
REAL x
f1=x
END FUNCTION

FUNCTION f2(x) RESULT (f) ! alternativni popis jmena a typu navratove hodnoty
IMPLICIT NONE
REAL f,x
f=x
END FUNCTION

! podprogram jako samostatna programova jednotka
SUBROUTINE s(x)
IMPLICIT NONE
REAL x
print *,x
END SUBROUTINE
