program fibonacci_iterative_2

  implicit none

  print *, fibonacci(0, 1, 1)
  print *, fibonacci(0, 1, 3)
  print *, fibonacci(0, 1, 5)
  print *, fibonacci(0, 1, 7)
  print *, fibonacci(0, 1, 10)

  stop 0

  contains

    ! Computes Fibonacci's sequence (series).
    ! (iterative version)
    ! Does not check if f1 and f2 are right numbers!
    !
    ! :param(in) integer f1
    ! :param(in) integer f2
    ! :param(in) integer n
    ! :return    integer fibonacci(1:n)
    function fibonacci(f1, f2, n)

      integer, intent(in) :: f1, f2, n
      integer :: i, fibonacci(1:n)

      if (n < 1) then
        stop "The `n` must be an integer greater then 0."
      end if

      fibonacci(1) = f1
      fibonacci(2) = f2

      do i = 3, n
          fibonacci(i) = fibonacci(i - 1) + fibonacci(i - 2)
      end do
  end function

end program