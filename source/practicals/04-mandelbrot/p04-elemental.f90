! Staticka a (dynamicka) alokovatelna pole (vektory a matice)
! volitelne hodnoty dolni meze v jednotlivych dimenzich
! prvkova (elemental) prirazeni, prvkove vyrazy a prvkove funkce

integer ia(3),matrix(1:5,0:5)   ! staticky 3prvkovy vektor a 5x6 matice
real,allocatable :: a(:),b(:,:) ! alokovatelny vektor a matice

print *,ia  ! vypis neinicializovanych hodnot
ia=1        ! inicializace vsech prvku pole pole skalarem
print *,ia

allocate (a(3))     ! alokace alokovatelneho pole
print *,a           ! vypis neinicializovanych hodnot
a=[1.,2.,3.]        ! prvkove prirazeni (prvek po prvku) konstruktoru pole
a=[(real(i),i=1,3)] ! totez s cyklickym seznamem
a=real([(i,i=1,3)]) ! totez s prvkovou funkci
a=-a                ! prvkove prirazeni
print *,a
print *,abs(a)      ! interni prvkova funkce
print *,myAbs(a)    ! externi (vlastni) prvkova funkce 
deallocate (a)      ! dealokace

contains

elemental function myAbs(a)  ! prvkova funkce
real myAbs                   ! skalarni argument, funkci lze volat i s poli
real,intent(in) :: a         ! argumenty prvkove funkce musi byt pouze vstupni
myAbs=abs(a)
end function

end program
