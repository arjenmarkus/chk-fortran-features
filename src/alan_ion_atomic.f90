! alan_ion_atomic.f90 --
!
program alan_ion_atomic
   implicit none

   integer            :: n
   integer, parameter :: nelements = 20
   !integer ion_end(nelements)
   integer, parameter :: iatomic_number(nelements) = [&
         1,2,6,7,8,10,11,12,13,14,15,16,17,18,20,22,24,25,26,28]

   !integer, parameter :: ion_end(nelements) = [&
   !      (sum(iatomic_number(1:n)), n=1,nelements)]

   integer :: ion_end(nelements)
   !data ion_end / (sum(iatomic_number(1:n)), n=1,nelements) /
   data ion_end / (n, n=1,nelements) /

   write(*,*) ion_end

!   ion_end(1) = iatomic_number(1)
!   do ielement = 2, nelements
!       ion_end(ielement) = ion_end(ielement-1) + iatomic_number(ielement)
!   enddo

end program alan_ion_atomic
