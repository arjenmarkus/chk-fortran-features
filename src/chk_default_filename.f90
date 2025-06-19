! chk_default_filename.f90 --
!     Check what name is used for files that are not explicitly opened (fort.88 for instance?)
!
program chk_default_filename
    implicit none

    integer            :: ierr
    character(len=100) :: filename

    write( *, '(a)' ) 'Write to a file that is not explicitly opened ...'

    write( 10, '(a)', iostat = ierr ) 'Some string'
    if ( ierr /= 0 ) then
        write( *, '(a)' ) 'Failed to write to such a file'
    else
        inquire( 10, name = filename, iostat = ierr )
        if ( ierr == 0 ) then
            write( *, '(a,a)' ) 'File written to at unit 10 has the name: ', trim(filename)
        else
            write( *, '(a,a)' ) 'Inquire statement failed - cannot determine the default name'
        endif
    endif
end program chk_default_filename
