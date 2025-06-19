! chk_halfpi.f90 --
!     Check if the compiler supports the trigonometric functions that work with half revolutions
!
program chk_halfpi
    implicit none

    real :: angle

    angle = 0.5

    write(*,*) 'sin(half pi) = ', sinpi(angle)
    write(*,*) 'cos(half pi) = ', cospi(angle)
    write(*,*) 'tan(half pi) = ', tanpi(angle)

    angle = 0.35

    write(*,*) 'sin(quarter pi) = ', sinpi(angle)
    write(*,*) 'cos(quarter pi) = ', cospi(angle)
    write(*,*) 'tan(quarter pi) = ', tanpi(angle)

end program chk_halfpi
