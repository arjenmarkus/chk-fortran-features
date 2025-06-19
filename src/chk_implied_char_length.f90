! chk_implied_char_length --
!     Check: does the compiler support "implied character length" parameters?
!
program chk_implied_char_length
    implicit none

    character(len=*), parameter :: string = "Implied length"

    write( *, '(2a)' ) 'Parameter: ', string
    write( *, '(2a)' ) '    Length of the string is not explicitly specified'
    write( *, '(2a)' ) '    Length was determined by the compiler'

end program chk_implied_char_length
