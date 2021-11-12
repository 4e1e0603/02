program main
    implicit none

    integer, parameter :: mSize = 10000
    integer :: i, j
    integer :: pCnt, nCnt, cntRt, cntMx
    integer, dimension(mSize, mSize) :: a, b
    integer, dimension(mSize, mSize, 3) :: c

    pCnt = 0
    call SYSTEM_CLOCK(nCnt, cntRt, cntMx)
    print *, "First call: ", nCnt - pCnt
    pCnt = nCnt

    do j = 1, mSize
        do i = 1, mSize
            a(i, j) = i*j
            b(i, j) = i+j
        end do
    end do

    call SYSTEM_CLOCK(nCnt, cntRt, cntMx)
    print *, "Created Matrices: ", nCnt - pCnt
    pCnt = nCnt

    ! OPERATIONS BY SLICING NOTATION
    !c(1:mSize, 1:mSize, 1) = a + b
    !c(1:mSize, 1:mSize, 2) = a - b
    !c(1:mSize, 1:mSize, 3) = a * b

    ! OPERATIONS WITH LOOP
    do j = 1, mSize
        do i = 1, mSize
            c(i, j, 1) = a(i, j) + b(i, j)
            c(i, j, 2) = a(i, j) - b(i, j)
            c(i, j, 3) = a(i, j) * b(i, j)
        end do
    end do

    call SYSTEM_CLOCK(nCnt, cntRt, cntMx)
    print *, "Added Matrices: ", nCnt-pCnt
    pCnt = nCnt
end program main