! chk_logical_eq.f90 --
!     Check if the compiler accepts .EQ. (and such) for logicals
!
program chk_logical_eq
    implicit none

    logical :: x, y

    x = .true.
    y = .true.

    if ( x .eq. y ) then
        write( *, '(a)' ) 'Logical variables can be compared via .EQ.'
    else
        write( *, '(a)' ) 'Logical variables can NOT be properly compared via .EQ.'
    endif
end program chk_logical_eq
