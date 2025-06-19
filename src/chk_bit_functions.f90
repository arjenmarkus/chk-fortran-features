! chk_bit_functions.f90 --
!     Check if the new Fortran 2008 bit functions are all implemented
!
program chk_bit_functions
    implicit none

    integer               :: i, j, k
    integer, dimension(3) :: array

    write( *, '(a)' ) 'This program simply calls the various Fortran 2008 bit functions:'
    write( *, '(a)' ) '(No attempt is made to check the results)'

    i = 1234
    j = 4321

    write( *, '(a)'     )     'Combined shifting:'
    write( *, '(a,i12)' )     '    dshiftl:   ', dshiftl(i,j,2)
    write( *, '(a,i12)' )     '    dshiftr:   ', dshiftr(i,j,2)

    write( *, '(a)'     )     'Counting bits:'
    write( *, '(a,i12)' )     '    leadz:     ', leadz(i)
    write( *, '(a,i12)' )     '    popcnt:    ', popcnt(i)
    write( *, '(a,i12)' )     '    poppar:    ', poppar(i)
    write( *, '(a,i12)' )     '    trailz:    ', trailz(i)

    write( *, '(a)'         ) 'Masking bits:'
    k = 3
    write( *, '(a,i12,b33)' ) '    maskl:     ', maskl(k), maskl(k)
    write( *, '(a,i12,b33)' ) '    maskr:     ', maskr(k), maskr(k)

    write( *, '(a)'         ) 'Shifting bits:'
    write( *, '(a,i12,b33)' ) '    shifta:    ', shifta(i,k), shifta(i,k)
    write( *, '(a,i12,b33)' ) '    shiftl:    ', shiftl(i,k), shiftl(i,k)
    write( *, '(a,i12,b33)' ) '    shiftr:    ', shiftr(i,k), shiftr(i,k)

    write( *, '(a)'         ) 'Merging bits:'
    k = 31
    write( *, '(a,i12,b33)' ) '    merge_bits:', merge_bits(i,j,k), merge_bits(i,j,k)

    write( *, '(a)'         ) 'Bit transformational functions:'
    array = [1,2,3]
    write( *, '(a,i12,b33)' ) '    iall:      ', iall(array), iall(array)
    write( *, '(a,i12,b33)' ) '    iany:      ', iany(array), iany(array)
    write( *, '(a,i12,b33)' ) '    iparity:   ', iparity(array), iparity(array)

end program chk_bit_functions
