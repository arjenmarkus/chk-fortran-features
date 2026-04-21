! chk_forward_reference_dimension.f90 --
!     Check: What happens if you reference an argument to be used as a dimension
!            before it is declared?
!
!     gfortran: allows this
!     ifx: complains about the prior use of b
!
!     Note:
!     If you change b to nb, it is accepted by ifx.
!
program chk_forward_reference_dimension
    implicit none

    integer :: x(10)
    integer :: y

    y = size(x)

    call print_size( x, y )

contains

subroutine print_size( a, b )
!   integer, intent(in) :: b
    integer, intent(in) :: a(b)
    integer, intent(in) :: b

    write(*, '(a)' )     'Forward referencing is accepted: '
    write(*, '(a,i10)' ) 'Size: ', size(a)

end subroutine print_size

end program chk_forward_reference_dimension
