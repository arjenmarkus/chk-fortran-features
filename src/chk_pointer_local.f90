! chk_pointer_local --
!     Check if the compiler detects a problem with a pointer to a local variable
!
!     gfortran presented the final result as 60
!
module some_variables
    implicit none

contains

recursive subroutine set_pointer( p )
    integer, pointer :: p

    integer,target   :: local_and_temporary

    local_and_temporary = 111
    p => local_and_temporary

end subroutine set_pointer

recursive subroutine mess_up_stack
    integer, dimension(10) :: x

    x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

end subroutine mess_up_stack

end module some_variables

program chk_pointer_local
    use some_variables

    implicit none

    integer          :: value_p
    integer, pointer :: p_dangerous

    write( *, '(a)') 'Set a pointer to a local variable in a subroutine'

    call set_pointer( p_dangerous )

    p_dangerous = 42

    write( *, '(a)' )     'Before the call to the subroutine:'
    write( *, '(a,l4)' )  'Associated? ', associated(p_dangerous)
    write( *, '(a,i10)' ) 'Value:      ', p_dangerous

    if ( p_dangerous == 42 ) then
        write( *, '(a)' ) '    Apparently the original value is preserved (by accident?)'
    else
        write( *, '(a)' ) '    Apparently the value has been changed (dangling pointer)'
    endif

    value_p = p_dangerous

    call mess_up_stack

    write( *, '(a)' )     'After the call to the subroutine:'
    write( *, '(a,l4)' )  'Associated? ', associated(p_dangerous)
    write( *, '(a,i10)' ) 'Value:      ', p_dangerous

    if ( p_dangerous == 42 ) then
        write( *, '(a)' ) '    Apparently the original value is preserved (by accident?)'
    elseif ( p_dangerous == value_p ) then
        write( *, '(a)' ) '    Apparently the value has not been changed via an extra call (coincidence?)'
    else
        write( *, '(a)' ) '    Apparently the value has been changed via an extra call'
    endif

end program chk_pointer_local
