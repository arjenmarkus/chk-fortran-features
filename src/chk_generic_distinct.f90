! chk_generic_distinct.f90 --
!     Check if the compiler supports distinguishing specific routines via pointer/allocatable
!
module handle_arrays
    implicit none

    interface is_an_allocatable
        module procedure is_an_allocatable_array
        module procedure not_an_allocatable_array
    end interface
contains
logical function is_an_allocatable_array( array )
    real, dimension(:), allocatable :: array

    is_an_allocatable_array = .true.
end function is_an_allocatable_array

logical function not_an_allocatable_array( array )
    real, dimension(:), pointer :: array

    not_an_allocatable_array = .false. ! A bit strange, couldn't think of an appropriate name
end function not_an_allocatable_array
end module handle_arrays

program chk_generic_distinct
    use handle_arrays

    implicit none

    real, dimension(:), allocatable, target :: array
    real, dimension(:), pointer             :: parray

    write( *, '(a)'  ) 'Extra distinction for generic interfaces:'
    write( *, '(2a)' ) '    Argument was "allocatable"? ', merge( "Yes", "No ", is_an_allocatable( array ) )
    write( *, '(2a)' ) '    Argument was "pointer"?     ', merge( "Yes", "No ", is_an_allocatable( parray ) )
end program chk_generic_distinct
