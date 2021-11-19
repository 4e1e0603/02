!! -*- coding: utf-8 -*-

!! Tests for random_walk modules.

program random_walk_test

    use, intrinsic :: iso_fortran_env, only: sp => real32, dp => real64

    use random_walk, only: state, update, simulate

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 9, TRIALS = 1

    type(state) :: current ! => defaults to (t = 0.0, x = 0.0, y = 0.0)

    block
        current % x = 0.0; current % y = 0.0
        current = update(0.0, current)
        print *, ((current % x) == -1.0) .and. ((current % y) == 0.0), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.0 THEN x == -1 AND y = 0.0"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update(0.25, current)
        print *, ((current % x) == 1.0) .and. ((current % y) == 0.0), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.25 THEN x == 1 AND y = 0.0"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update(0.5, current)
        print *, ((current % y) == -1.0) .and. ((current % x) == 0.0), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.5 THEN x == 0.0 AND y == -1"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update(0.75, current)
        print *, ((current % y) == 1.0 .and. ((current % x) == 0.0)), &
        "GIVEN We are at position (0, 0) WHEN the random number == 0.75 THEN x = 0.0 AND y == 1"
    end block

    block
        current % x = 0.0; current % y = 0.0
        current = update(0.1, current) ! left
        current = update(0.1, current) ! left
        current = update(0.8, current) ! up
        current = update(0.8, current) ! up
        print *, ((current % x) == -2.0 .and. ((current % y) == 2.0)), &
        "GIVEN We are at position (0, 0) WHEN random numbers are 0.1, 0.1, 0.8, 0.8 THEN x = -2.0 AND y == 2.0"
        end block

    block ! TODO
        current % x = 0.0; current % y = 0.0
        ! current = update_restricted(0.0, current, "N")
        ! current = update_restricted(0.0, current, "E")
        ! current = update_restricted(0.0, current, "S")
        ! current = update_restricted(0.0, current, "W")
        ! print *, &
        ! "GIVEN ... WHEN ... THEN ..."
    end block


    block ! 1D random walk
        ! state1 % t = 0.0; state1 % x = 0.0

        ! print *,  simulate_1d(1, 1)
        ! print *, state1
    end block
end