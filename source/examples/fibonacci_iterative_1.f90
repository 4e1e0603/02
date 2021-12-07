program fibonacci_recursive
    implicit none

    print *, fibonacci(1)
    print *, fibonacci(3)
    print *, fibonacci(5)
    print *, fibonacci(7)
    print *, fibonacci(10)

    stop

  contains

      ! Computes a Fibonacci's sequence (series).
      ! (iterative version)
      ! :param(in) integer n
      ! :return    integer fibonacci(1:n)
      function fibonacci(n)

          integer, intent(in) :: n
          integer :: fibonacci(1:n), i

          fibonacci(1) = 0
          fibonacci(2) = 1

          do i = 3, n
              fibonacci(i) = fibonacci(i - 1) + fibonacci(i - 2)
          end do
    end function

  end program