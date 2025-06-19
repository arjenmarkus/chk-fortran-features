! chk_c_sizeof.f90 --
!     Check if the compiler supports the Fortran 2008 C_sizeof function
!
program chk_c_sizeof
    use iso_c_binding

    implicit none

    type, bind(c) :: some_data
        integer   :: x
        character :: y
    end type some_data

    type(some_data) :: xy

    write( *, '(a,i5)' ) 'For a simple derived type, C_sizeof() returns: ', c_sizeof(xy)
end program chk_c_sizeof
