! -*- coding: utf-8 -*-
!
! Test for `random_walk_2d` module.
!
program random_walk_2d_test

    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    use random_walk, only: position, update_position, simple_random_walk_2D

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 10, TRIALS = 1

    type(position) :: current ! => (x = 0.0, y = 0.0)

    real :: walks(1:TRIALS, 1:STEPS, 1:3)
    real :: randoms(1:TRIALS, 1:STEPS)

    ! GIVEN We are on postion 0,0
    ! WHEN the rundom number is < 0.5
    ! THEN we should move in `x` direction.
    do step = 1, size(randoms)
        current = update_position(randoms(1, step), current)
        print *, "UPDATED", (current % x), (current % y), randoms(1, step)
    end do

end