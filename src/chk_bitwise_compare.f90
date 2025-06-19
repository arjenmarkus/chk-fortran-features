! chk_bitwise_compare.f90 --
!     Check if the compiler supports the bitwise comparison functions
!
program chk_bitwise_compare
    implicit none

    integer :: one, two

    write( *, '(a)' ) 'How do two integers compare as a bit seuqence?'

    one = 12
    two = 13

    write( *, '(a,2i5)' ) 'Integers: ', one ,two
    write( *, '(a,a)'   ) 'BGT:      ', merge( 'True ', 'False', bgt(one,two) )
    write( *, '(a,a)'   ) 'BGE:      ', merge( 'True ', 'False', bge(one,two) )
    write( *, '(a,a)'   ) 'BLT:      ', merge( 'True ', 'False', blt(one,two) )
    write( *, '(a,a)'   ) 'BLE:      ', merge( 'True ', 'False', ble(one,two) )

end program chk_bitwise_compare
