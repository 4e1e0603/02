!!
!! The n-dimensional simple random walk
!!
!! Created by Ladislav Hanyk and modestly commented by David Landa.
!!
!! @param constant NDIM Set the number of dimension.
!!
program simple_random_walk

  implicit none
  integer,parameter :: NDIM = 5 ! The arbitrary number of dimensions.

  !! The random walks state at the given time.
  type state
    real time
    real,allocatable :: position(:)
    real distance
  end type

  ! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! Calculate the random walk simulation.
  ! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  ! Define variables.
  type(state) current ! The initial random walk state.
  real r              ! The storage for random number.

  ! Declare variable.
  allocate (current % position(NDIM))
  current % time = 0.
  current % position = 0.

  do
    call random_number(r)
    current = update(current, r)
    print '(f0.1,*(:,"|",f0.2))', current % time, current % position, current % distance
  enddo
  ! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  contains

  !! Choose a direction after the given random number and update a current state.
  function update(current, random) result (updated)

    type(state) updated
    type(state), intent(in) :: current
    real,intent(in) :: random
    integer direction, element, step, i
    integer :: elements(NDIM * 2) = [(i, i = 1, NDIM), (i, i = 1, NDIM)] ! elements corresponding to a direction
    integer :: steps(NDIM * 2) = [(1, i = 1, NDIM), (-1, i = 1, NDIM)]   ! steps corresponding to a direction

    allocate (updated % position, source = current % position)

    updated % time = current % time + 1
    direction = int(random * NDIM * 2) + 1   ! transformation of random to 1:NDIM*2
    element=elements(direction)              ! transformation of direction to 1:NDIM
    step = steps(direction)                    ! transformation of direction to 1|-1

    updated % position(element) = current % position(element) + step
    updated % distance = norm2(updated % position)

  end function

end program
