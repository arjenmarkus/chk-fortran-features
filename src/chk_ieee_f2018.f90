! chk_ieee_f2018.f90
!     Check: does the compiler support the Fortran 2018 extended IEEE features?
!
program chk_ieee_f2018
    use ieee_arithmetic
    use ieee_exceptions
    implicit none

    real                   :: single
    real(kind=kind(1.0d0)) :: double

    type(ieee_modes_type)  :: mode
    type(ieee_round_type)  :: round

    integer                :: radix

    write( *, '(a)' )        'IEEE arithmetic support (Fortran 2018):'
    write( *, '(a20,3a10)' ) 'Type of support', ' All kinds', '    Single', '    Double'
    write( *, '(a20,3l10)' ) 'Subnormal   ',ieee_support_subnormal(), ieee_support_subnormal(single), ieee_support_subnormal(double)

    !
    ! Simply call some of the new subroutines - the linker makes the check
    !
    call ieee_get_modes( modes )

    call ieee_get_rounding_mode( round, radix )

    single = ieee_real( 1.1d0 )
    single = ieee_fma( 1.1d0, 2.3d0, 4.2d0 )

end program chk_ieee_f2018
