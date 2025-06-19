! chk_format_f03.f90 --
!     Check if the format f0.3 adds a leading zero or not
!     Note: this was subject of a discussion on the Intel Forum in december 2017
!
program chk_format_f03
    implicit none

    real              :: x
    character(len=20) :: string
    integer           :: k

    x = 0.1
    write( string, '(f0.3,a)' ) x, '<'

    write( *, '(a,f0.3)' ) 'The value 0.1 is written as: ', x

    k = index( string, '<' )
    write( *, '(a,i0)' )   'Actual width of the number: ', k-1

    k = index( string, '0.' )
    if ( k == 0 ) then
        write( *, '(a)' ) '    Note: no leading zero printed!'
    else
        write( *, '(a)' ) '    Note: with this format a leading zero is printed'
    endif

    x = -0.1
    write( string, '(f0.3,a)' ) x, '<'

    write( *, '(a,f0.3)' ) 'The value -0.1 is written as: ', x

    k = index( string, '<' )
    write( *, '(a,i0)' )   'Actual width of the number: ', k-1

    k = index( string, '0.' )
    if ( k == 0 ) then
        write( *, '(a)' ) '    Note: no leading zero printed!'
    else
        write( *, '(a)' ) '    Note: with this format a leading zero is printed'
    endif
end program chk_format_f03
