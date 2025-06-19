! chk_boz_extended --
!     Check: does the compiler support the extended use of BOZ values?
!
program chk_boz_extended
    implicit none

    integer                :: int_value
    real                   :: real_value
    real(kind=kind(1.0d0)) :: double_value

    int_value     = z'3f7'
    real_value    = z'3f700000'
    double_value  = z'3f70000000000000'

    write( *, '(a)'        ) 'Direct assignments via BOZ values:'
    write( *, '(a)'        ) 'Using hexadecimal values:'
    write( *, '(a,i0)'     ) '    Integer:          ', int_value
    write( *, '(a,e14.6)'  ) '    Single precision: ', real_value
    write( *, '(a,e20.12)' ) '    Double precision: ', double_value

    write( *, '(a)'        ) 'Using an octal value:'
    write( *, '(a,i0)'     ) '    Integer:          ', o'123'
    write( *, '(a)'        ) 'Using a binary value:'
    write( *, '(a,i0)'     ) '    Integer:          ', b'110011'

end program chk_boz_extended
