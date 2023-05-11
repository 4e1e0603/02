! Formatovani zdrojoveho kodu: volny format (obvykle pripony .f90, .f95, .f03)

! delka radku az 132 znaku, vsechny pozice rovnocenne
! pokracovaci radky: predchozi radek ukoncen povinne znakem &, pokracovaci radek nepovinne uvozen znakem &
! radkovy komentar za vykricnikem
! navesti na zacatku radku oddelene mezerou

PROGRAM p01               ! nepovinny popis hlavniho programu

! deklaracni cast programove jednotky
INTEGER,PARAMETER :: DP=8 ! popis celociselne symbolicke konstanty
INTEGER i,j               ! popis celociselnych promennych default presnosti (obvykle 4 byty)
REAL :: x                 ! popis realne promenne jednoduche presnosti (4 byty)
REAL(DP) :: x8            ! popis realne promenne dvojnasobne presnosti (8 bytu)
COMPLEX :: c=(-1.,0.)     ! popis komplexni promenne jednoduche presnosti (2x4 byty) s inicializaci
REAL,PARAMETER :: PI=3.1415926,PI2=PI*2. ! popis realnych symbolickych konstant

! prikazova cast programove jednotky
i=-1                      ! prirazovaci prikaz s integer literalem
x=-1.                     ! prirazovaci prikaz s real(4) literalem
x8=-1._DP                 ! prirazovaci prikaz s real(8) literalem
c=-1.                     ! implicitni konverze real(4) na complex(4)
print *,i,x,sqrt(x),sqrt(c) ! prikaz pro vypis s default formatovanim
! pr. g95: 1 -1. NaN (0.,1.) neboli integer 1, real -1., not-a-number, imaginarni jednotka

print *, &
  'abcd'                  ! pokracovaci radek
print *,'ab&
  &cd'                    ! s & na pokracovacim radku lze trhat i retezcove literaly

goto 99                   ! skok na navesti
99 continue               ! radek s navestim a prazdnym prikazem; navesti jsou ve Fortranu 90+ k nicemu

END PROGRAM               ! koncovy popis programove jednotky
