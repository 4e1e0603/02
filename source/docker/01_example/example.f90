program example01

  real, allocatable :: x(:)
  integer :: i

  write(*,*) "Hello!"

  allocate(x(10))

  do i = 1, size(x)
    x(i) = i
  end do

  write(*,*) x

  write(*,*) "Results successfully written."

end program