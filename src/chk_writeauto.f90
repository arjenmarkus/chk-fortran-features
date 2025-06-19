! chk_writeauto.f90 --
!     Check: Does the compiler allow you to use a deferred-length character variable in internal
!     writes, such that the variable is automatically reallocated?
!
program chk_writeauto
    implicit none

    character(len=:), allocatable :: string

    write( string, * ) 1, 2, 3, 4, 5

    write(*,*) 'String: ', string
    write(*,*) 'Length: ', len(string)
end program chk_writeauto
