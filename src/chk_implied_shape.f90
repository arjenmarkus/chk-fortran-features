! chk_implied_shape --
!     Check: does the compiler support "implied shape" arrays?
!
program chk_implied_shape
    implicit none

    integer, parameter, dimension(*) :: values = (/ 1, 2, 3, 4 /)

    write( *, '(a)' )      'Parameter array:'
    write( *, '(a,i5)' )   '    Size:   ', size(values)
    write( *, '(a,10i5)' ) '    Values: ', values

end program chk_implied_shape
