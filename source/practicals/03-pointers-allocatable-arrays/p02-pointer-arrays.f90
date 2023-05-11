! Dynamicka pole: ukazatelova pole

real,pointer :: p(:),r(:)
allocate (p(3))
p=1.
! r=p  ! pokus o kopirovani hodnot, ale automaticka alokace ukazatelovych poli nelze
r=>p   ! kopirovani adresy
p=2.
print *,p,r ! same dvojky

p=3.
allocate (r(3))  ! alokace druheho pole
r=p    ! kopirovani hodnot
p=4.
print *,p,r ! v p trojky, v r ctyrky

r=>p   ! memory leak byvaleho cile r
print *,p,r ! same trojky

end
