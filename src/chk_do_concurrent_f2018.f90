! chk_do_concurrent_f2018.f90 --
!     Check: does the compiler support the DO CONCURRENT locality clauses (F2018)?
!
program chk_do_concurrent_f2018
    implicit none

    integer :: i
    real, dimension(1000) :: array
    real                  :: b

    do concurrent (i=1:size(array)) local( b )
        b        = exp(i/1000.0)
        array(i) = b**2
    enddo

    write( *, '(a)' ) 'The DO CONCURRENT construct is supported'
end program chk_do_concurrent_f2018
