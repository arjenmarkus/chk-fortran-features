! chk_automatic_trim.f90 --
!     Check: does the compiler support the "at" edit descriptor?
!
program chk_automatic_trim
    implicit none

    character(len=50) :: string_out
    character(len=50) :: string_trim
    character(len=50) :: string

    string = 'Short string'

    write( string_out,  '(a, at,a)' ) '>', string,       '<'
    write( string_trim, '(a, a,a)' )  '>', trim(string), '<'

    if ( string_out == string_trim ) then
        write( *,* ) 'The "at" edit descriptor automatically trims the string'
    else
        write( *,* ) 'The "at" edit descriptor is not properly supported'
    endif
end program chk_automatic_trim
