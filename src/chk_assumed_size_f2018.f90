! chk_assumed_size_f2018.f90 --
!     Check if the compiler supports the size = -1 for assumed-size arrays
!     (Fortran 2018)
!
program chk_assumed_size_f2018
    implicit none

    integer, dimension(10) :: array

    call print_size( array )

contains
subroutine print_size( a )
    integer, dimension(*) :: a

    write( *, '(a,i0)' ) 'Assumed-size array has size ', size(a)

    if ( size(a) /= -1 ) then
        write( *, '(a)' ) '    Note: the reported size should have been -1'
        write( *, '(a)' ) '          This does not conform to Fortran 2018'
    endif

end subroutine print_size
end program chk_assumed_size_f2018
