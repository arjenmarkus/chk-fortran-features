! chk_compensated_summation.f90 --
!      Compensated summation relies on the precise formulation and evaluation of
!      sums of reals to produce a result that is more precise than naïve summation.
!      However, some compilers may upset this algorithm because they optimise away
!      the parentheses.
!
!      See https://en.wikipedia.org/wiki/Kahan_summation_algorithm
!      This is also the source for the numerical example.
!
!      This small program tries to detect this. Compile it with and without
!      optimisation.
!
!      NOTE:
!      Not distinctive enough!
!
program chk_compensated_summation
    implicit none

    real, dimension(3)     :: x = [10000.0, 3.141529, 2.71828]
    real                   :: rsum, t, c, y, naive_sum
    integer                :: i
    real(kind=kind(1.0d0)) :: dsum


    rsum = 0.0
    c   = 0.0

    do i = 1,size(x)
        y = x(i) - c
        t = rsum + y
        c = (t - rsum) - y
        rsum = t
    enddo

    naive_sum = sum(x)
    dsum = sum( real(x, kind=kind(1.0d0)) )

    write(*,'(a,e20.12)') 'Sum:       ', rsum
    write(*,'(a,e20.12)') 'Naive:     ', naive_sum
    write(*,'(a,e20.12)') 'Expected:  ', 10005.9
    write(*,'(a,e20.12)') 'Expected:  ', dsum
end program chk_compensated_summation
