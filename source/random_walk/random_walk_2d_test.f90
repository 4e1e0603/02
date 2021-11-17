! -*- coding: utf-8 -*-
!
! Test for `random_walk_2d` module.
!
! The initiall position is set to (0, 0) and we test, that `update_position` procedure
! correctly updates the given state and returns a new state. in tets ee mutate state
! in each test do there are not indeoendent, but works as pipeline.
! All test should print `T`.
!
program random_walk_2d_test

    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
    use random_walk, only: position, update_position, simple_random_walk_2D

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 9, TRIALS = 1

    type(position) :: current ! => defaults to (x = 0.0, y = 0.0)

    real :: walks(1:TRIALS, 1:STEPS, 1:3)
    real :: randoms(1:TRIALS, 1:STEPS)

    ! Unnecessary, but I keep it here for reference.
    ! Mock the random numbers with  numbers useful for testing.
    ! randoms = reshape((/0.0, 0.1, 0.25, 0.4, 0.5, 0.6, 0.75, 0.9, 1.0/), [1, 9])
    ! Show the random numbers.
    ! do step = 1, size(randoms)
    !     print*, randoms(1, step)
    ! end do

    block

        print *, __FILE__, __LINE__
    end block

    block
        print *, "GIVEN We are on position (0, 0) WHEN the random number < 0.0 THEN x == -1"
        current = update_position(0.0, current)
        print *, ((current % x) == -1.0), current
    end block

    block
        print *,"GIVEN We are on position (0, -1) WHEN the random number == 0.25 THEN x == 0"
        current = update_position(0.25, current)
        print *, ((current % x) == 0.0), current
    end block
end