! chk_writealloc.f90 --
!     Check: Does the compiler allow you to write a derived type with an allocatable component
!     via list-directed output?
!
!     Note: this is not allowed according to gfortran and Intel Fortran, but PG Fortran
!     does allow it. Consider this an extension!
!
program chk_writealloc
    implicit none

    type mydata
        character(len=:), allocatable :: string
    end type mydata

    type(mydata) :: data

    data%string = 'A simple string'

    write(*,*) data

    write(*,*) 'Apparently the compiler allows this as an extension'
end program chk_writealloc
