! -*- coding: utf-8 -*-
!
! PROGRAM:
!   Random walk simulation
!
!   To simulate and analyze various types of random walks on the lattice in the plane (all steps are
!   of the same length d = 1, but the direction is randomly chosen from a certain set of prescribed
!   possibilities).
!
!   1. Simple random walk on 2-dimensional lattice
!      steps in any of the four directions  with the same probability.
!
!   2. Restricted random walk on 2-dimensional lattice
!     1. without immediate returns
!        steps in three possible directions with the same probability, the first step is in any direction
!
! REFERENCE:
!   http://utf.mff.cuni.cz/vyuka/NTMF021/homeworks/HW_task_1.pdf
!
module random_walk

implicit none

private

public :: simple_random_walk_2D

contains

pure function evolve_coordinate(random, current) result(next)
    !! Evolve the coordinate value based on the given random value.
    !! (This is a helper procedure.)
    implicit none

    real, intent(in) :: random  ! The random number between [0,1].
    real, intent(in) :: current ! The current coordinate value.
    real :: next

    ! Choose direction and update coordinate.
    if (random >= 0.5) then
        next = current + 1
    else
        next = current - 1
    end if

end function

function simple_random_walk_2D(steps, trials) result(walks)
    !! Realize 2-dimensional simple random walk on ℤ for the given number of steps.
    !! Computes the `x`, `y` coordinates and Euclidean distance from the origin.

    implicit none

    integer, intent(in) :: steps, trials            ! The input variable.
    real, dimension(:,:,:), allocatable :: walks    ! The output array for (x,y,d).

    real :: rvalue                                  ! The random value.
    real :: x, y                                    ! The coordinates.
    integer :: step, trial                          ! A current step.

    allocate(walks(1:trials, 1:steps, 1:3))         ! Allocate the output array.

    do trial = 1, trials

        x = 0.0                                     ! Start always at origin.
        y = 0.0

        do step = 1, steps

            call random_number(rvalue)
            x = evolve_coordinate(rvalue, x)

            call random_number(rvalue)
            y = evolve_coordinate(rvalue, y)

            ! Save the coordinates and Euclidean distance
            walks(trial, step, 1) = x
            walks(trial, step, 2) = y
            walks(trial, step, 3) = sqrt(x ** 2 + y ** 2)

        end do
    end do

end function

! function restricted_random_walk_2D(steps, trials) result() ... end function

end module

!
! TODO Simple command line interface.
! HOWTO Write an array to CSV like format?
!
program random_walk_simulation

    use random_walk, only: simple_random_walk_2D

    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 5, TRIALS = 2

    real :: walk(1:TRIALS, 1:STEPS, 1:3)

    ! Compute the random walk simulation.
    walk = simple_random_walk_2D(TRIALS, STEPS)

    ! Write the result to the standard output.
    do trial = 1, TRIALS
        do step = 1, STEPS
            write(*,'(f0.1,a,f0.1,a,f0.4)') walk(trial, step, 1), '|',  walk(trial, step, 2), '|', walk(trial, step, 3)
        end do
        write(*, *) ''
    end do

end program