! NDIM-dimensional simple random walk
! non-constant NDIM

implicit none
integer :: NDIM=5 ! arbitrary number of dimensions
type state
  real time
  real,allocatable :: position(:)
  real distance
end type
type(state) current
real r

allocate (current%position(NDIM))
current%time=0.
current%position=0.

do
  call random_number(r)
  current=update(current,r)
  print '(f0.1,*(:,"|",f0.2))',current%time,current%position,current%distance
enddo

contains

function update(current,random) result (updated)
type(state) updated
type(state),intent(in) :: current
real,intent(in) :: random
integer direction,element,step,NDIM,i
integer :: elements(2*size(current%position)) ! elements corresponding to a direction
integer :: steps(2*size(current%position))    ! steps corresponding to a direction 

NDIM=size(current%position)
elements=[(i,i=1,NDIM),(i,i=1,NDIM)]
steps=[(1,i=1,NDIM),(-1,i=1,NDIM)]
updated%time=current%time+1
allocate (updated%position,source=current%position)
direction=int(random*NDIM*2)+1   ! transformation of random to 1:NDIM*2
element=elements(direction)      ! transformation of direction to 1:NDIM
step=steps(direction)            ! transformation of direction to 1|-1
updated%position(element)=current%position(element)+step
updated%distance=norm2(updated%position)
end function

end program
