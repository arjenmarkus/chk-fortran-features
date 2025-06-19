! chk_coarrays_image.f90 --
!     If the compiler supports coarrays, then the intrinsic
!     function this_image() must be known.
!
program chk_coarrays_image
    implicit none

    write(*,*) 'Image: ', this_image()
end program chk_coarrays_image
