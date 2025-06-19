! chk_open_action.f90 --
!     Check if the compiler supports the ACTION= specifier on OPEN
!     It is a simple check
!
program chk_open_action
    implicit none

    integer :: lun, ierr

    lun = 10

    open( lun, file = 'chk_open_action.inp' )
    write( lun, * ) 'Text'
    close( lun )

    open( lun, file = 'chk_open_action.inp', action = 'read', status = 'old', iostat = ierr )
    if ( ierr /= 0 ) then
        write( *, '(a)' )    'Open statement (read-only) on chk_open_action.inp failed - ', &
                             '    this is unexpected, as it was just created'
        write( *, '(a,i5)' ) '    Error code: ', ierr
        write( *, '(a)'    ) '    Please check!'
    else
        write( *, '(a)' ) 'Open statement on chk_open_action.inp succeeded, now write to it'
        write( lun, '(a)', iostat = ierr ) 'Another text'

        if ( ierr /= 0 ) then
            write( *, '(a)' ) 'Writing to the file was not permitted, as expected'
        else
            write( *, '(a)' ) 'Writing to the file succeeded - it should have failed'
            write( *, '(a)' ) '    Please check!'
        endif
    endif
end program chk_open_action
