! chk_char_to_int.f90 --
!     Check: Can you assign a character string to an integer?
!
!     ifx accepts it, unless you specify a standard.
!     gfortran does not.
!     neither does flang
!
program chk_char
    implicit none

    integer :: vstring

    vstring = '1234'

    write( *, '(a,i0)' ) 'String as integer: ', vstring
end program chk_char
