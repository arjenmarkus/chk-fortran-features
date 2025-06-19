! chk_initialise_sum.f90 --
!     Check: does the compiler allow you to use SUM() (or similar intrinsics) in an initialisation statement?
!
!     This question popped up in a search for initialising an array without requiring the user to
!     call an initialisation routine. The Intel Fortran compiler and the nVidia compiler do not accept this,
!     gfortran and the NAG compilers do.
!
program chk_initialise_sum
   implicit none

   integer            :: n
   integer, parameter :: nelements = 20
   integer, parameter :: integer_value(nelements) = [&
         0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]

   !
   ! It does not seem to make a difference whether the array is an array of parameters or an ordinary one
   !
   !integer, parameter :: summed_value(nelements) = [&
   !      (sum(integer_value(1:n)), n=1,nelements)]
   integer :: summed_value(nelements) = [&
         (sum(integer_value(1:n)), n=1,nelements)]

   write(*,*) 'Sum of integer values:'
   write(*,*) summed_value

end program chk_initialise_sum
