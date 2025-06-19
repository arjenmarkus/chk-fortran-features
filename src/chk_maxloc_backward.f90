! chk_maxloc_backward.f90 --
!     Check if the compiler supports the BACK argument to MAXLOC and MINLOC
!
program chk_maxloc_backward
    implicit none

    integer, dimension(10) :: array = (/ 1, 5, 3, 4, 5, 1, 2, 3, 4, 5 /)

    write( *, '(a)' ) 'Location of minimum and maximum values - with duplicates'

    write( *, '(a,i5)' ) '    Minimum (first): ', minloc(array)
    write( *, '(a,i5)' ) '    Minimum (first): ', minloc(array, back = .false.)
    write( *, '(a,i5)' ) '    Minimum (last):  ', minloc(array, back = .true.)
    write( *, '(a,i5)' ) '    Maximum (first): ', maxloc(array)
    write( *, '(a,i5)' ) '    Maximum (first): ', maxloc(array, back = .false.)
    write( *, '(a,i5)' ) '    Maximum (last):  ', maxloc(array, back = .true.)

end program chk_maxloc_backward
