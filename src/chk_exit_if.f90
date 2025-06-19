! chk_exit_if.f90 --
!     Check if the compiler supports exiting any named construct
!
program chk_exit_if
    implicit none

    real :: value

    write( *, '(a)' ) 'Can we exit an IF-block?'

    call random_number( value )

ifblock: &
    if ( value >= 0.0 ) then
        if ( value <= 1.0 ) then
            value = -1.0
            exit ifblock
            write( *, '(a)' ) '    Apparently the EXIT did not work!'
            value = 1.0
        else
            write( *, '(a)' ) '    This is unexpected - random value > 1?'
        endif
    endif &
ifblock

    if ( value == -1.0 ) then
        write( *, '(a)' ) '    Skipping over the rest of the IF-block possible without GOTO'
    endif

end program chk_exit_if
