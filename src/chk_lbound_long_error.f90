! chk_lbound_long_error --
!     Check: does the compiler complain if lbound returns a value that is too large?
!
!     Note 1: I came across that when first using long/large array indices
!     Note 2: This doesn't test the dynamic behaviour of lbound()
!
program chk_lbound_long_error
    implicit none

    integer, parameter                         :: long = selected_int_kind(range(1)+1)
    integer(kind=long), parameter              :: bignumber = huge(1_long)

    integer, dimension(bignumber-10:bignumber) :: value
    integer(kind=long)                         :: i
    integer(kind=long), dimension(1)           :: lower, upper

    write(*, '(a)' ) 'Using "long" integers as array indices:'

    write(*, '(a,i0)') 'Lower bound:   ', lbound(value)
    write(*, '(a,i0)') 'Correct value: ', bignumber-10

    write(*, '(/a)') 'Apparently the compiler does not do a check on the range'

end program chk_lbound_long_error
