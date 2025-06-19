! chk_type_intrinsic --
!     Check: does the compiler support the Fortran 2008 syntax of type(intrinsic)?
!
!     Note: such syntax unifies the way to define variables of intrinsic and derived types.
!     This could be used for a form of generic programming
!
program chk_type_intrinsic
    implicit none

    type(integer) :: value
    type(real(kind=kind(1.0))) :: rvalue

    value = 1
    rvalue = 1.0
    write(*, '(a)')    'Declaration of integer and real variables via TYPE(...) works:'
    write(*, '(a,i0)') 'Integer value: ', value
    write(*, '(a,g0)') 'Real value:    ', rvalue

end program chk_type_intrinsic
