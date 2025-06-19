! chk_contiguous_non.f90 --
!     Check what happens if a non-contiguous array is passed to a subroutine that expects a contiguous one
!
module contiguous_arrays
    implicit none
contains
subroutine copy_double_array( a, b )
    real, dimension(:), contiguous :: a, b

    a = 2.0 * b
end subroutine copy_double_array
end module contiguous_arrays

program chk_contiguous_non
    use contiguous_arrays

    implicit none

    real, dimension(10)    :: a
    real, dimension(10,10) :: b
    real, dimension(40)    :: c

    call random_number( b )
    call random_number( c )

    write( *, '(a)' ) 'Pass a non-contiguous array to a subroutine that expects a contiguous one:'

    call copy_double_array( a, b(1,:) )

    write( *, '(/,a,a)') 'Array section: b(1,:)'
    write( *, '(a,a)') 'Apparently correct operation? ', merge( 'yes', 'no ', all( a == 2.0 * b(1,:) ) )

    call copy_double_array( a, c(1::4) )

    write( *, '(/,a,a)') 'Array section: c(1::4)'
    write( *, '(a,a)') 'Apparently correct operation? ', merge( 'yes', 'no ', all( a == 2.0 * c(1::4) ) )

    write( *, '(/,a)' ) 'The program survived - this may indicate temporary arrays were created'


end program chk_contiguous_non
