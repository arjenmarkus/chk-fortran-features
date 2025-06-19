! chk_logical_kinds.f90 --
!     Check if the compiler supports the selected_logical_kind intrinsic
!
program chk_logical_kinds
    implicit none

    integer :: k

    write(*,*) 0, ';', 1, ' byte', selected_logical_kind(1)
    do k = 1,10
        write(*,*) k, ';', 8*k, 'bytes', selected_logical_kind(8*k)
    enddo

end program chk_logical_kinds
