! chk_uddtio.f90 --
!     Check if the compiler supports user-defined I/O for derived types
!
module uddtio_address
    implicit none

    type address
        character(len=20) :: street
        character(len=20) :: city
    contains
        generic :: write(formatted) => write_address
    end type

contains
subroutine write_address( dtv, unit, iotype, vlist, iostat, iomsg )
    class(address), intent(in)        :: dtv
    integer, intent(in)               :: unit
    character(len=*), intent(in)      :: iotype
    integer, dimension(:), intent(in) :: vlist
    integer, intent(out)              :: iostat
    character(len=*), intent(inout)   :: iomsg

    iostat = 0
    iomsg  = ' '

    write( unit, '(a,a,a)' ) dtv%street, ' - ', dtv%city
end subroutine write_address
end module uddtio_address

program chk_uddtio
    use uddtio_address

    implicit none

    type(address) :: address1 = address( "Street", "City" )

    write( *, '(a)' ) 'The compiler supports user-defined I/O:'
    write( *, '(dt "combined")' ) address1
end program chk_uddtio
