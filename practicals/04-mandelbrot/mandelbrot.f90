! Testovani bodu Mandelbrotovy mnoziny
! Paralelizace pomoci OpenMP (PARALLEL DO, PARALLEL WORKSHARE) a DO CONCURRENT

! Preklad pro sekvencni beh
! gfortran -O3 mandelbrot.f90
! ifort mandelbrot.f90

! Preklad pro aralelni beh (OpenMP)
! gfortran -O3 -fopenmp mandelbrot.f90
! (win) ifort -Ofast -Qopenmp mandelbrot.f90
! (lnx) ifort -Ofast -qopenmp mandelbrot.f90
! nvfortran -Ofast -mp mandelbrot.f90

! Modul s konstantami programu
module mConst
integer,parameter  :: rp=4      ! real precision: 4, 8
integer,parameter  :: output=2  ! 0 none, 1 formatted, 2 binary
real(rp),parameter :: xmin=-2,xmax=0.6,ymin=-1.2,ymax=1.2  ! bounds
integer,parameter  :: ixmax=2000,iymax=1500                ! resolution
integer,parameter  :: nmax=100                             ! max number of iterations
end module

include 'mTicToc.f90'  ! pripojeni modulu s merenim wallclock time

! Modul s prvkovou funkci
module mMandelbrot
use mConst,only : rp,nmax
implicit none

contains

elemental function mandelbrot(c) result (nstop)
  integer nstop,n
  complex(rp),intent(in) :: c
  complex(rp) z
  z=0.
  nstop=0
  do n=1,nmax
    z=z*z+c
    if (abs(z)>2) exit
  enddo
  nstop=n
end function

end module

program testMandelbrot
  use mConst
  use mMandelbrot
  use mTicToc
  implicit none
  complex(rp),allocatable :: ca(:,:)
  integer,allocatable :: na(:,:)
  real(rp) x,y
  complex(rp) c
  integer ix,iy,id

  allocate (ca(ixmax,iymax))
  allocate (na,mold=int(ca))

  ! priprava vstupnich poli
  call tic
  do ix=1,ixmax
    x=xmin+(xmax-xmin)*(ix-1)/(ixmax-1) ! p�epo�et na <xmin,xmax>
    do iy=1,iymax
      y=ymin+(ymax-ymin)*(iy-1)/(iymax-1) ! p�epo�et na <ymin,ymax>
      ca(ix,iy)=cmplx(x,y)
    enddo
  enddo
  print '(a20,f10.4)','init: ',toc()

  ! vypocet pomoci paralelizovatelneho sekvencniho cyklu
  call tic
  !$OMP PARALLEL DO
  do iy=1,iymax
    do ix=1,ixmax
      na(ix,iy)=mandelbrot(ca(ix,iy))
    enddo
  enddo
  !$OMP END PARALLEL DO
  print '(a20,f10.4)','do loop: ',toc()

  ! vypocet pomoci prvkove funkce
  call tic
  !$OMP PARALLEL WORKSHARE
  na=mandelbrot(ca)
  !$OMP END PARALLEL WORKSHARE
  print '(a20,f10.4)','elemental function: ',toc()

  ! vypocet pomoci paralelizovatelneho cyklu DO CONCURRENT
  call tic
  do concurrent (iy=1:iymax,ix=1:ixmax)
    na(ix,iy)=mandelbrot(ca(ix,iy))
  enddo
  print '(a20,f10.4)','do concurrent loop: ',toc()

  select case (output)
  case (1)  ! formatted output
    open (newunit=id,file='mandelbrot.dat')
    write (id,'(2f8.4,i4)') ((ca(ix,iy),na(ix,iy),iy=1,iymax),ix=1,ixmax)
    close (id)
  case (2)  ! binary output (unformatted stream)
    open (newunit=id,file='mandelbrot.bin',form='unformatted',access='stream',status='replace')
    write (id) ((ca(ix,iy),na(ix,iy),iy=1,iymax),ix=1,ixmax)
    close (id)
  end select
end program
