! Ukazatele
! alokace nepojmenovanych cilu

real,pointer :: p=>null(),r=>null()  ! deklarace s inicializaci

! standardni zivotni cyklus ukazatele
allocate (p)  ! alokace pameti pro nepojmenovany cil a nasmerovani ukazatele
p=1.          ! automaticka dereference, prirazeni do cile ukazatele
if (associated(p)) print *,'1:',p  ! 1., vypis obsahu cile ukazatele
deallocate (p)

if (associated(p)) print *,'2:',p  ! double free v podminenem prikazy

! memory leak
allocate (p)  ! alokace pameti pro nepojmenovany cil a nasmerovani ukazatele
p=1.
if (associated(p)) print *,'3:',p  ! 1.
p=>null()     ! cil stale alokovany, ale nedostupny

! dangling pointer
allocate (p)
p=1.
r=>p
print *,'4:',p,r
deallocate (p)
print *,'5:',r,associated(r)  ! cil r dealokovany, ale asociovany

! double free
allocate (p)
p=1.
r=>p
print *,'6:',p,r
deallocate (p)
deallocate (r)  ! double free, tichy pad programu (windows: gfortran i ifort)

print *,'stop'

end