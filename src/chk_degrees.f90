! chk_degrees.f90 --
!     Check if the compiler supports the trigonometric functions that work with degrees
!
program chk_degrees
    implicit none

    real :: angle

    angle = 90.0

    write(*,*) 'sin(90 degrees) = ', sind(angle)
    write(*,*) 'cos(90 degrees) = ', cosd(angle)
    write(*,*) 'tan(90 degrees) = ', tand(angle)

    angle = 45.0

    write(*,*) 'sin(45 degrees) = ', sind(angle)
    write(*,*) 'cos(45 degrees) = ', cosd(angle)
    write(*,*) 'tan(45 degrees) = ', tand(angle)

end program chk_degrees
