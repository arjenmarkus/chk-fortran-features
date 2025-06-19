! compensated.f90 --
!     Compensated summation according to Kahan
!
module m
implicit none
private
public :: sumc,wp
integer, parameter :: wp = kind(1.0d0)
contains
function sumc(a) result(asum)   !add elements of the array, using limited precision.
real(kind=wp)   , intent(in) :: a(:)
real(kind=wp)                :: asum
real(kind=wp)                :: s,c,y,t ! assistants.
integer                      :: i ! stepper
integer                      :: n
n = size(a)
if (n < 1) then
   asum = 0.0_wp
   return
end if
s = a(1)        ! start with the first element.
c = 0.0_wp      ! no previous omissions to carry forward.
do i = 2,n      ! step through the remainder of the array.
   y = a(i) - c         ! combine the next value with the compensation.
   t = s + y            ! augment the sum, temporarily in t.
   c = (t - s) - y      ! catch what part of y didn't get added to t.
   s = t                ! place the sum.
end do                  ! on to the next element.
asum = s                ! c will no longer be zero.
end function sumc
end module m
program main
! 04/26/2021 11:39 AM driver for sumc
use m, only: sumc,wp
implicit none
integer, parameter :: n = 100000000
real(kind=wp)      :: x(n)
real(kind=wp), parameter :: xadd = 10.0_wp**15
call random_seed()
call random_number(x)
x = x + xadd
print*,([sumc(x),sum(x)] - n*xadd)/n
end program main
