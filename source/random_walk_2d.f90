! -*- coding: utf-8 -*-
!
! Program: Random walk simulation
!
! To simulate and analyze various types of random walks on the lattice in the plane (all steps are
! of the same length d = 1, but the direction is randomly chosen from a certain set of prescribed
! possibilities).
!
! 1. Simple random walk 2D
! steps in any of the four directions  with the same probability.
!
! 2. Random walk without immediate returns
! steps in three possible directions with the same probability, the first step is in any direction
!


module random_walk

    implicit none

    private

    public :: simple_random_walk_2D

    contains

    ! Realise of 2-dimensional dicrete random walk for the given number of steps.
    !
    ! We call this random walk as simple because thre are no restrictions on the step to
    ! be taken.
    !
    function simple_random_walk_2D(steps) result(walk)

        implicit none

        integer, intent(in) :: steps                  ! The input variable.
        real, dimension(:,:), allocatable :: walk     ! The output variable.

        real :: rvalue                                ! The random value.
        real :: x = 0, y = 0                          ! The starting position.
        integer :: step                               ! A current step.

        allocate(walk(1:3,1:steps))                   ! Set the size of the output array.
                                                      ! We store coordinates as [x, y, ..., x, y].
        do step = 1, steps

            call random_number(rvalue)                 ! The `x` coordinate direction choice.
            if (rvalue >= 0.5) then
                x = x + 1
            else
                x = x -1
            end if

            call random_number(rvalue)                 ! The `y` coordinate direction choice.
            if (rvalue >= 0.5) then
                y = y + 1
            else
                y = y - 1
            end if

            walk(1, step) = x                         ! Save the `(x, y, d)` coordinates and distance.
            walk(2, step) = y
            walk(3, step) = sqrt(real(x * x) + y*y)   ! Euclidean distance.
        end do

    end function

end module


! TODO Simple command line interface.

program random_walk_simulation

    use random_walk, only: simple_random_walk_2D

    implicit none

    integer :: step
    integer, parameter :: N = 10

    real :: walk(1:3, 1:N)

    walk = simple_random_walk_2D(N)

    do step = 1, N
        print '((f5.1) "," (f5.1) "," (f5.1))', walk(1, step), walk(2, step), walk(3, step)
    end do

end program