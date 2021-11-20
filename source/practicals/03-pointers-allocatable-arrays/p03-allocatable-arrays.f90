! Dynamicka pole: alokovatelna pole

real,allocatable :: p(:),r(:)
integer ierr

allocate (p(3))
p=1.
r=p  ! automaticka alokace alokovatelnych poli
r=2.
print *,p,r ! jednicky a dvojky
deallocate (r)

! allocate (r(size(p))) ! vhodnejsi postupy pro klonovani viz nize
allocate (r,mold=p)     ! alokace podle masky, bez inicializace hodnot
print *,p,r             ! jednicky a smeti
deallocate (r)

allocate (r,source=p)   ! alokace s inicializaci hodnot
print *,p,r             ! same jednicky

if (.not.allocated(r)) allocate (r,source=p) ! podminena alokace
allocate (r,source=p,stat=ierr)  ! alokace s diagnostikou
print *,'ierr = ',ierr  ! chybovy kod

end
