! chk_coarrays_reduction.f90 --
!     Check: does the compiler support reduction operations with coarrays
!
program chk_coarrays_reduction
    implicit none

    real, dimension(10), codimension[*]    :: rvalue
    integer, dimension(10), codimension[*] :: value
    integer                                :: i

    if ( this_image() == 1 ) then
        write( *, '(a)' ) 'Using co-reduction routines for integer values: '
    endif

    !
    ! Fill the integer coarray
    !
    value = [ (this_image() * i, i = 1,size(value)) ]

    sync all

    call co_sum( value(1), 1 )
    if ( this_image() == 1 ) then
        write( *, '(a,10i5)' ) 'Cosum: ', value(1)
    endif

    call co_max( value(2), 1 )
    if ( this_image() == 1 ) then
        write( *, '(a,10i5)' ) 'Comax: ', value(2)
    endif

    call co_min( value(3), 1 )
    if ( this_image() == 1 ) then
        write( *, '(a,10i5)' ) 'Comin: ', value(3)
    endif

    !
    ! Fill the real coarray
    !
    rvalue = [ (this_image() * 0.1, i = 1,size(value)) ]

    sync all

    if ( this_image() == 1 ) then
        write( *, '(a)' ) 'Using co-reduction routines for real values: '
    endif

    call co_sum( rvalue(1), 1 )
    if ( this_image() == 1 ) then
        write( *, '(a,f10.5)' ) 'Cosum: ', rvalue(1)
    endif

    call co_max( rvalue(2), 1 )
    if ( this_image() == 1 ) then
        write( *, '(a,f10.5)' ) 'Comax: ', rvalue(2)
    endif

    call co_min( rvalue(3), 1 )
    if ( this_image() == 1 ) then
        write( *, '(a,f10.5)' ) 'Comin: ', rvalue(3)
    endif

end program chk_coarrays_reduction
