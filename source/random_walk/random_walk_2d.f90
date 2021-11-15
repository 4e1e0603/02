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
! - http://utf.mff.cuni.cz/vyuka/NTMF021/homeworks/HW_task_1.pdf
! - http://compphysics.github.io/ComputationalPhysics/doc/pub/rw/html/._rw-bs061.html
! - https://github.com/jakehanson/2D_RANDOM_WALK/blob/master/main.cpp
! - https://balitsky.com/teaching/phys420/Ph4_random.pdf
! - https://blogs.sas.com/content/iml/2015/07/08/drunkards-walk.html
! - https://blogs.sas.com/content/iml/2015/08/12/2d-drunkards-walk.html
! - https://gist.github.com/rsnemmen/879cb5452effcf2d20a8f0041b8724e4
! - https://cyber.dabamos.de/programming/modernfortran/random-numbers.html
!
! DECISIONS:
! ---
! TODO I decided to pass a random numbers as values to functions.
! The reason is that it is more testable the generatei inside functions.
! We can pregenreate random values
! at the beginning of the program and then pass them down to procedures/fucntions.
! ---
! I also decided to use type (structure) `position`.
! The reason is that it better express a domain model and encapsultes `x`, `y` coordinates.
! ---
! Can  we determined trials and steps from random?
!
!
! TODO function persistent_random_walk_2D(steps, trials) result() ... end function
! TODO function restricted_random_walk_2D(steps, trials) result() ... end function
! TODO Simple command line interface.
! HOWTO Write an array to CSV like format?
!
module random_walk

    implicit none

    private

        !! The position on 2-dimensional lattice.
        type, public :: position
            real :: x = 0.0;
            real :: y = 0.0;
        end type

    public :: simple_random_walk_2D, update_position

    contains

    pure function update_position(random, current) result(updated)
        !! Update the current position.
        !!
        !!            N
        !!          W o E
        !!            S
        !!
        !! @param random  The random number.
        !! @param current The current position.
        !! @return output The updated position.
        !!
        implicit none

        real,           intent(in)  :: random
        type(position), intent(in)  :: current
        type(position)              :: updated

        updated % x = current % x
        updated % y = current % y

        if (random >= 0.0 .and. random < 0.25) then
            updated % x = (current % x) - 1 ! W
        end if

        if (random >= 0.25 .and. random < 0.5) then
            updated % x = (current % x) + 1 ! E
        end if

        if (random >= 0.5 .and. random < 0.75) then
            updated % y = (current % y) - 1 ! S
        end if

        if (random >= 0.75 .and. random <= 1.0) then
            updated % y = (current % y) + 1 ! E
        end if


    end function


    pure function simple_random_walk_2D(steps, trials, randoms) result(walks)
        !! Realize 2-dimensional simple random walk on ℤ for the given number of steps.
        !!
        !! @param steps
        !! @param trials
        !! @param randoms
        !! @return  The  `x`, `y` position coordinates and Euclidean distance from the origin.
        !!
        implicit none

        integer, intent(in) :: steps, trials            ! The input variable.
        real, dimension(:,:,:), allocatable :: walks    ! The output array for (x,y,d).

        real, intent(in)    :: randoms(trials, steps)   ! The random numbers.
        type(position)      :: current                  ! The current position (0,0).
        integer             :: trial, step              ! The current trial and step.

        allocate(walks(1:trials, 1:steps, 1:3))         ! Allocate the output array.

        do trial = 1, trials
            ! Reset the position before each run.
            current % x = 0.0
            current % y = 0.0

            do step = 1, steps
                current = update_position(randoms(trial, step), current)
                ! Save the position and distance.
                walks(trial, step, 1) = current % x
                walks(trial, step, 2) = current % y
                walks(trial, step, 3) = sqrt((current % x) ** 2 + (current % y) ** 2)
            end do
        end do

    end function

end module


program random_walk_simulation

    use random_walk, only: simple_random_walk_2D, position, update_position

    use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64

    implicit none

    integer :: step, trial
    integer, parameter :: STEPS = 10, TRIALS = 1

    type(position) :: current, updated

    real :: walks(1:TRIALS, 1:STEPS, 1:3)
    real :: randoms(1:TRIALS, 1:STEPS)

    ! Compute the random walk simulation.
    call random_number(randoms)
    ! walks = simple_random_walk_2D(TRIALS, STEPS, randoms)

    ! TESTS
    ! GIVEN We are on postion 0,0, WHEN the rundom number is < 0.5 THEN we should move in `x` direction.
    print *, "CURRENT", current
    print *, "UPDATED",  updated

    updated = update_position(randoms(1, 1), current)

    print *, "RANDOM", randoms(1, 1)

    if (randoms(1, 1) < 0.5) then
        print *, "SHOULD GO X", (updated % x) != 0.0
    end if
    print *, "UPDATED", updated


    ! Write the result to the standard output.
    ! do trial = 1, TRIALS
    !     do step = 1, STEPS
    !         write(*,'(f0.1,a,f0.1,a,f0.4)')  &
    !              walks(trial, step, 1), '|', &
    !              walks(trial, step, 2), '|', &
    !              walks(trial, step, 3)
    !     end do
    !     write(*, *) ''
    ! end do



end program