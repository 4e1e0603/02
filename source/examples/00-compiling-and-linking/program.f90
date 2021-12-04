!!
!! Example program
!!
program example_program

    use module_1, hello_1 => hello ! Name the `hello` procedure frome `module_1` as `hello_1`.
    use module_2, hello_2 => hello ! Name the `hello` procedure frome `module_2` as `hello_2`.

    implicit none

    call hello_1
    call hello_2

end program