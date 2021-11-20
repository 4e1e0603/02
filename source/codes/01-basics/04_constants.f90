integer, parameter :: dp=8

integer i

! real*8

! Uvedení bytů u čísla
!

print *, 1_1, 1_2, 1_4, 1_8
print *, int(1, 1) ! Převést na 1_1

print *, 2_1**7_1 - 1_1 ! 1-bytová aritmetika s přetečením
print *, 2**31 - 1      ! 4-bytová aritmetika

print *, huge(1_1), huge(1_2), huge(1_4), huge(1_8)

i = 0

print * , 1/i ! Jak to dopadne v intelu? gfrotran hlásí fp exception
print * , 0/i ! 0/0 vyhodnotí na 0

! Přepínač gfortran -ftrapv


print *, 1.. 1e0, 1._4, 1e0_4

print *, 1d0, 1._8, 1e0_8

print *, 1._dp, 1e0_dp

x = 1e30
x = x **10 ! přetečení je infinity pro real aritmetiku

! Za chodu programu přetečení nevadí...
print *, x, 1e300_8, real(x, 8)
!                         ^^^^^
! 4-bytové infinity, 8-bytové infinity

print *, huge(1._4), huge(1._8), huge(1._16)

print *, 1./i, 0./i ! Infitnity, NaN (not a number)

! stop

print *, 1/3 ! integer dělění
print *, 1./3.  single precision real divide

print *, 1_8/3, 1._8/3., 1._8/3._8

print *, 0.3333333 !
print *, 0.3333333333333333333333

x = 1./10
print *, real(x, 8)
stop

! čísla s násobkem 2 ve jemnovateli, jsou reprezentovatelná přesně.


! Převody z integeru na real

print *, 2**(-3), (1/2)**3, 2**(-3) ! 0, 0, 0.125

! Inkrementace s real aritmetikou je možné zapnout, ale nikoliv ve standardu již.
! Může chybět nebo přebývat jedna iterace. Nepoužívat!
do x = 0., 1., 0.1
    print *, x
end do


! Převod na komplexní číslo `cmplx(...)`.
! Přebírá tři argumenty...

! Konverze k řetězcům.
