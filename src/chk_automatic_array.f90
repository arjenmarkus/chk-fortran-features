! chk_automatic_array --
!     Check the behaviour of a program that uses increasingly large automatic arrays
!
!     Background:
!     Managing the memory associated with arrays that do not have the SAVE attribute differs
!     between compilers. Some use the stack (fast), some use the heap (slow), some will
!     use a combination. Notably on Windows, the stack is rather small, so that large automatic
!     arrays give problems at run-time.
!     This behaviour can often be influenced by compiler options.
!
module handle_array
    implicit none
contains
subroutine fill_array( n, sumofvalues )
    integer, intent(in) :: n
    real, intent(out)   :: sumofvalues

    real, dimension(n) :: array

    array = 1.0

    sumofvalues = sum(array)
end subroutine fill_array
end module handle_array

program chk_automatic_array
    use handle_array

    implicit none

    integer :: i, sz
    real    :: result

    sz = 1

    write( *, '(a)' ) 'Use successively larger automatic arrays:'
    write( *, '(a)' ) 'NOTE: it may crash before the end of the run'

    !
    ! Let the array increase to 100 million elements, that ought to be well
    ! within the limits of a 32-bits program
    !
    do i = 1,8
        sz = 10 * sz

        call fill_array( sz, result )

        write( *, '(a,i10,a)' ) 'Size: ', sz, ' - succeeded'
    enddo

    write( *, '(a)' ) 'Apparently you can use very large automatic arrays'
end program chk_automatic_array
