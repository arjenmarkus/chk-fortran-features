! chk_dir_separator.f90 --
!     Check if a program can use the UNIX directory separator
!
!     Background:
!     If you work on Windows and UNIX/Linux-like operating systems, it
!     is annoying to have to distinguish between forward and backward slashes
!     in file names. If the forward slash is accepted, then you only need
!     a single version.
!
program chk_dir_separator
    implicit none

    integer :: lun, ierr

    lun = 10

    open( lun, file = 'chk_dir_separator.inp' )
    write( lun, '(a)' ) 'Text'
    close( lun )

    open( lun, file = './chk_dir_separator.inp', status = 'old', iostat = ierr )
    if ( ierr /= 0 ) then
        write( *, '(a)' ) 'Open statement on chk_dir_separator.inp failed - ', &
                          '    apparently the forward slash is not seen as a directory separator'
    else
        write( *, '(a)' ) 'Open statement on chk_dir_separator.inp succeeded -'
        write( *, '(a)' ) '    forward slashes acceptable as directory separator'
    endif
end program chk_dir_separator
