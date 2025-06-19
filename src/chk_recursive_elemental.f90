! chk_recursive_elemental.f90 --
!     Check: does the compiler support recursive elemental functions?
!
!     This is a Fortran 2018 feature
!
!     Use the somewhat overly used Fibonacci numbers (inspired by a
!     blog by Milan Curcic)
!
program chk_recursive_elemental
    implicit none

    integer, dimension(10) :: f

    f = fibonacci( [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] )

    write( *, '(a,10i5)' ) 'The first ten Fibonacci numbers: ', f
contains
recursive elemental function fibonacci( n ) result(fib)
    integer, intent(in) :: n
    integer             :: fib

    if ( n <= 0 ) then
        fib = 0
    elseif ( n == 1 ) then
        fib = 1
    else
        fib = fibonacci(n-1) + fibonacci(n-2)
    endif
end function fibonacci
end program chk_recursive_elemental
