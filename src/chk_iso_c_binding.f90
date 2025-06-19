! chk_iso_c_binding.f90 --
!     Check if the compiler has the intrinsic ISO_C_BINDING module and allows the BIND attribute
!
!     Note:
!     No need to actual call the C function, definingh the interface is enough
!
program chk_iso_c_binding
    use, intrinsic :: iso_c_binding

    interface
         function some_c_function( x ) bind(c, name = 'SomeFunction' )
             import :: c_int
             integer(kind=c_int), value :: x
             integer(kind=c_int)        :: some_c_function
         end function some_c_function
    end interface

    write( *, '(a)' ) 'The C/Fortran interfacing as defined by the Fortran 2003 seems to work'
    write( *, '(a)' ) 'Here are a few comparisons between types and kinds:'

    write( *, '(a)' )         'Integer kinds:'
    write( *, '(a,i5,1x,a)' ) '    Fortran default integer: ', kind(1)
    write( *, '(a,i5,1x,a)' ) '    C_SHORT:                 ', c_short
    write( *, '(a,i5,1x,a)' ) '    C_INT:                   ', &
        c_int, merge('Matches INTEGER', '               ', c_int == kind(1))
    write( *, '(a,i5,1x,a)' ) '    C_LONG:                  ', &
        c_long, merge('Matches INTEGER', '               ', c_long == kind(1))
    write( *, '(a,i5,1x,a)' ) '    C_LONG_LONG:             ', &
        c_long_long, merge('Matches INTEGER', '               ', c_long_long == kind(1))
    write( *, '(a,i5,1x,a)' ) '    Fortran single-precision:', kind(1.0)
    write( *, '(a,i5,1x,a)' ) '    Fortran double-precision:', kind(1.0d0)
    write( *, '(a,i5,1x,a)' ) '    C_FLOAT:                 ', &
        c_float, merge('Matches REAL   ', '               ', c_float == kind(1.0))
    write( *, '(a,i5,1x,a)' ) '    C_DOUBLE:                ', &
        c_double, merge('Matches double-precision REAL   ', '                                ', c_double == kind(1.0d0))
end program chk_iso_c_binding
