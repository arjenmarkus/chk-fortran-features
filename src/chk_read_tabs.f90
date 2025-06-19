! chk_read_tabs.f90 --
!     Check how the program behaves when there are tabs in the input string
!
program chk_read_tabs
    implicit none

    character(len=20) :: string
    integer           :: x, y, ierr

    string = '1' // achar(9) // '2'

    x = -1
    y = -1

    read( string, *, iostat=ierr ) x, y

    if ( ierr /= 0 ) then
        write( *, '(a)' ) 'Input with tabs causes an I/O error'
    else
        write( *, '(a)' ) 'Input with tabs is accepted without an I/O error'
        if ( x == 1 .and. y == 2 ) then
            write( *, '(a)' ) 'Values were read correctly'
        else
            write( *, '(a)' )    'Values were NOT read correctly:'
            write( *, '(a,i0)' ) '    x should have been 1, but read was: ', x
            write( *, '(a,i0)' ) '    y should have been 2, but read was: ', y
        endif
    endif
end program chk_read_tabs
