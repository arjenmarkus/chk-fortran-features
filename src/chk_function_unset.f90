! chk_function_unset.f90 --
!     Check if the compiler checks for functions that do not set a value
!
program chk_function_unset
    implicit none

    integer :: x, y

    x = 1
    y = myfunc( x )

    write( *, '(a,i0)' ) 'Function did not set its return value, but the result is: ', y
contains
integer function myfunc( x )
    integer, intent(in) :: x

    integer :: z

    if ( x > 0 ) then
        z = 1
    else
        z = 2
    endif
end function myfunc
end program chk_function_unset
