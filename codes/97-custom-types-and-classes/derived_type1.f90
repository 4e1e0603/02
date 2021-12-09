!
! Example shows the custom derived type.
!
! https://livebook.manning.com/book/modern-fortran/chapter-10/v-11/
! Arithmetic operator overloading for derived types in three steps.
! https://stackoverflow.com/questions/28174711/overloading-the-equals-operator-in-fortran
! https://dannyvanpoucke.be/fortran-tutorials-en/
! https://dannyvanpoucke.be/oop-fortran-tut5-en/

module vector

    implicit none

    type vector2
        real x, y
    end type

    type vector3
      real :: x, y, z;

    ! contains
    ! procedure ::
    end type

    ! Parametrized data type (2003).

    type, public :: matrix(M, N, T)
        integer, len :: M, N
        integer, kind :: T = kind(0.0)
        real(kind = T), dimension(M, N) :: values
    end type


end module


program derived_type1

    use vector, only: vector3

    implicit none

    type(vector3) :: u = vector3(x=1., y=2., z=3.);
    type(vector3) :: v = vector3(x=3., y=2., z=1.);




end program