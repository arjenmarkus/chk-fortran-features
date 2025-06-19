! chk_reduce_concurrent.f90 --
!     Check: does the compiler allow reduce clauses on DO CONCURRENT?
!
program chk_reduce_concurrent
    implicit none

    integer :: i
    real    :: x, y
    real    :: z(10)

    z = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]

    x = 0.0

    do concurrent (i = 1:size(z)) reduce(+: x) reduce(max: y)
        x = x + z(i)
        y = max( z(i), 5.0 )
    enddo

    write( *, '(a,g10.4)' ) 'Sum over z:         ' , x
    write( *, '(a,g10.4)' ) 'Maximum of z and 5: ' , y

end program chk_reduce_concurrent
