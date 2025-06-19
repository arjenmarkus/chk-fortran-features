! chk_random_init.f90 --
!     Check if the compiler supports the random_init intrinsic function
!
program chk_random_init
    implicit none

    real, dimension(100) :: array1, array2


    !
    ! Call random_init and random_number twice in succession
    !
    call random_init( .true., .true. )
    call random_number( array1 )

    call random_init( .true., .true. )
    call random_number( array2 )

    if ( all( array1 == array2 ) ) then
        write( *, '(a)' ) 'The two arrays of random numbers are the same'
        write( *, '(a)' ) '(Apparently random_init reset the random number generator)'
    else
        write( *, '(a)' ) 'The two arrays of random numbers are NOT the same'
        write( *, '(a)' ) '(Apparently random_init did not reset the random number generator)'
    endif

end program chk_random_init
