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
! Refences:
! http://utf.mff.cuni.cz/vyuka/NTMF021/homeworks/HW_task_1.pdf

! Plot the mean distance vs number of steps (+ error bars given by standard deviation)
! Check that for every random walks dependence is of the form $R(n) = c n^{\alpha}$


module random_walk

    implicit none

    private

    public :: simple_random_walk_2D

    contains

    subroutine pick_coordinate(c, r)
        implicit none

        real, intent(in) :: r
        real, intent(inout) :: c

        if (r >= 0.5) then
            c = c + 1
        else
            c = c - 1
        end if

    end subroutine

    ! Realize 2-dimensional dicrete random walk for the given number of steps.
    !
    ! We call this random walk as simple because thre are no restrictions on the step to
    ! be taken.
    !
    function simple_random_walk_2D(steps) result(walk)
        implicit none

        integer, intent(in) :: steps                  ! The input variable.
        real, dimension(:,:), allocatable :: walk     ! The output variable.

        real :: rvalue                                ! The random value.
        real :: x = 0.0,  y = 0.0                     ! The starting position.
        integer :: step                               ! A current step.

        allocate(walk(1:3,1:steps))                   ! Set the size of the output array.
                                                      ! We store coordinates as [x, y, ..., x, y].
        do step = 1, steps

            call random_number(rvalue)                ! The `x` coordinate direction choice.
            call pick_coordinate(x, rvalue)

            call random_number(rvalue)                ! The `y` coordinate direction choice.
            call pick_coordinate(y, rvalue)

            walk(1, step) = x                         ! Save the `(x, y, d)` coordinates and distance
            walk(2, step) = y                         ! and calculate Euclidean distance
            walk(3, step) = sqrt(real(x * x) + y*y)
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