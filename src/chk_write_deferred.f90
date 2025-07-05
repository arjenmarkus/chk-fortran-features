! chk_write_deferred --
!     Check: does the compiler automatically allocate the string for internal writes?
!
!     Based on https://wg5-fortran.org/N2201-N2250/N2212.pdf, section 2.2
!
program chk_write_deferred
    implicit none

    integer                       :: x(10) = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    character(len=:), allocatable :: msg
    integer                       :: ierr
    integer                       :: value

    open( 10, file = '_runtime_check_' ); write( 10, *) 'Started'

    write( *, '(a)' )    'Writing 10 values to an allocatable string - automatic allocation?'

    write( msg, * ) x

    write( *, '(a,a)' ) '    Result: ', msg

    close( 10, status = 'delete' )
end program chk_write_deferred
