! chk_assumed_type.f90 --
!     Check if the compiler supports the assumed type syntax
!     (this has been introduced for C interoperability)
!
program chk_assumed_type
    implicit none

    interface
        subroutine use_arbitrary( var ) bind( c, name = 'use_arbitrary' )
            type(*) :: var
        end subroutine use_arbitrary
    end interface

    write( *, '(a)' ) 'The type(*) syntax is accepted'

end program chk_assumed_type
