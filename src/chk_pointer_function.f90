! chk_pointer_function --
!     Check: does the compiler support pointer functions?
!
program chk_pointer_function
    implicit none

    integer, dimension(10), target :: stored_value
    integer                        :: i

    write( *, '(a)' )      'Store data in an array via a pointer function:'

    stored_value = 0

    do i = 1,size(stored_value), 2
        storage(i) = i
    enddo

    do i = 1,size(stored_value)
        write( *, '(i5,a,2i5)' ) i, ':', stored_value(i), storage(i)
    enddo
contains

function storage(entry) result(loc)
    integer, intent(in) :: entry
    integer, pointer    :: loc

    loc => stored_value(entry)
end function storage

end program chk_pointer_function
