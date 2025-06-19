! chk_locate_string --
!     Check if the compiler allows the FINDLOC function to be applied to character strings
!
!     Note:
!     Not entirely sure this is indeed allowed by the standard
!
program chk_locate_string
    implicit none

    character(len=5), dimension(5) :: array = (/ 'MIN  ', 'MAX  ', 'MEAN ', 'STDEV', 'COUNT' /)

    write( *, '(6a)' )   'Array of strings: ', array
    write( *, '(a,i5)' ) 'The position of "MAX" is ', findloc(array, 'MAX')
end program chk_locate_string
