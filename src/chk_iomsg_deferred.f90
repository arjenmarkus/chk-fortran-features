! chk_iomsg_deferred --
!     Check: does the compiler automatically allocate the string for the error message?
!
!     Based on https://wg5-fortran.org/N2201-N2250/N2212.pdf, section 2.2
!
!     Note:
!     This is known to fail for at least one compiler version, because the
!     string is not allocated.
!
program chk_iomsg_deferred
    implicit none

    character(len=20)             :: string = 'Just some text'
    character(len=:), allocatable :: msg
    integer                       :: ierr
    integer                       :: value

    open( 10, file = '_runtime_check_' ); write( 10, *) 'Started'

    msg  = '?'
    ierr = 0

    write( *, '(a)' )    'Reading a value from a string - causing a runtime error'

    read( string, *, iostat = ierr, iomsg = msg ) value

    write( *, '(a,i0)' ) '    IOSTAT = ', ierr

    if ( ierr == 0 ) then
        write( *, '(/,a)' ) '    The error code was NOT set apparently!'
    endif

    if ( allocated(msg) ) then
        write( *, '(a,a)' )  '    IOMSG string allocated'
        write( *, '(a,a)' )  '    Message: ', trim(msg)
        if ( msg == '' ) then
            write( *, '(/,a)' ) '    The error message was NOT filled!'
        endif
    else
        write( *, '(a,a)' )  '    IOMSG string NOT allocated!'
    endif

    close( 10, status = 'delete' )
end program chk_iomsg_deferred
