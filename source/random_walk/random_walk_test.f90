! -*- coding: utf-8 -*-

! Test for `random_walk_2d` module.
!
! Unnecessary, but I keep it here for reference.
! Mock the random numbers with  numbers useful for testing.
! real :: walks(1:TRIALS, 1:STEPS, 1:3)
! real :: randoms(1:TRIALS, 1:STEPS)
! randoms = reshape((/0.0, 0.1, 0.25, 0.4, 0.5, 0.6, 0.75, 0.9, 1.0/), [1, 9])
!
program random_walk_2d_test

    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64

    use random_walk_2d, only: state, update_state, update_state_restricted, simulate

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 9, TRIALS = 1

    type(position) :: current ! => defaults to (x = 0.0, y = 0.0)

    block
        current % x = 0.0; current % y = 0.0
        current = update_position(0.0, current)
        print *, ((current % x) == -1.0) .and. ((current % y) == 0.0), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.0 THEN x == -1 AND y = 0.0"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update_position(0.25, current)
        print *, ((current % x) == 1.0) .and. ((current % y) == 0.0), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.25 THEN x == 1 AND y = 0.0"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update_position(0.5, current)
        print *, ((current % y) == -1.0) .and. ((current % x) == 0.0), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.5 THEN x == 0.0 AND y == -1"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update_position(0.75, current)
        print *, ((current % y) == 1.0 .and. ((current % x) == 0.0)), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.75 THEN x = 0.0 AND y == 1"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update_position(0.1, current) ! left
        current = update_position(0.1, current) ! left
        current = update_position(0.8, current) ! up
        current = update_position(0.8, current) ! up
        print *, ((current % x) == -2.0 .and. ((current % y) == 2.0)), &
        "GIVEN We are at position (0, 0) WHEN random numbers are 0.1, 0.1, 0.8, 0.8 THEN x = -2.0 AND y == 2.0"
        end block

    block ! TODO
        current % x = 0.0; current % y = 0.0
        current = update_position_restricted(0.0, current, "N")
        current = update_position_restricted(0.0, current, "E")
        current = update_position_restricted(0.0, current, "S")
        current = update_position_restricted(0.0, current, "W")
        print *, &
        "GIVEN ... WHEN ... THEN ..."
    end block
end