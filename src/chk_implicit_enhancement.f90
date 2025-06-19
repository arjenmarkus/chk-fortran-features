! chk_implicit_enhancement --
!     Check whether the Fortran 2018 enhancement of the IMPLICIT statement is supported
!
program chk_implicit_enhancement
    implicit none(type,external)

    write(*,*) 'The compiler accepts the enhancement to IMPLICIT'
end program chk_implicit_enhancement
