! chk_print_leading_zero.f90 --
!     Check: does the compiler support the F2023 specifier "leading_zero" (or lzp, lzs, lz edit descriptors)
!
program chk_print_leading_zero
    implicit none

    character(len=10) :: string
    integer           :: k
    real              :: x

    open( 10, file = 'chk_print_leading_zero.out', leading_zero = 'print' )

    x = 0.1

    write( 10, '(f6.2)' ) x

    close( 10 )

    open( 10, file = 'chk_print_leading_zero.out' )
    read( 10, '(a)' ) string

    k = index( '0.', string )
    if ( k > 0 ) then
        write( *, '(a,a)' ) 'Printing leading zero supported: ', trim(string)
    endif

    write( *, '(a,lzp,f6.2)' ) 'Print leading zero:    ', x
    write( *, '(a,lzs,f6.2)' ) 'Suppress leading zero: ', x

    write( string, '(f6.2)' ) x

    k = index( '0.', string )
    if ( k > 0 ) then
        write( *, '(a)' ) 'Default mode: print a leading zero'
    else
        write( *, '(a)' ) 'Default mode: suppress a leading zero'
    endif

end program chk_print_leading_zero
