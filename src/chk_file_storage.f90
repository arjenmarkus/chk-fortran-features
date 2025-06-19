! chk_file_storage.f90 --
!     Check the storage unit for direct-access and stream-access files
!
!     To do:
!     Add: n = storage_size( ... )
!
program chk_storage
    use iso_fortran_env

    implicit none

    integer :: filesize, charsize
    !
    ! First check the storage size for direct-access files
    !
    open( 10, file = 'chk_storage.bin', access = 'direct', recl = 1 )
    write( 10, rec = 1 ) 'A'
    close( 10 )

    inquire( file = 'chk_storage.bin', size = filesize )

    write( *, '(a,i0)' ) 'Minimum size of direct-access file (bytes): ', filesize

    !
    ! Remove the file
    !
    open( 10, file = 'chk_storage.bin', access = 'direct', recl = 1 )
    close( 10, status = 'delete' )

    !
    ! Then check the storage size for stream-access files
    !
    open( 10, file = 'chk_storage.bin', access = 'stream' )
    write( 10 ) 'A'
    close( 10 )

    inquire( file = 'chk_storage.bin', size = filesize )
    write( *, '(a,i0)' ) 'Size of stream-access file (bytes): ', filesize

    !
    ! Remove the file
    !
    open( 10, file = 'chk_storage.bin', access = 'stream' )
    close( 10, status = 'delete' )

    !
    ! Report the advertised storage unit
    !
    write( *, '(a,i0)'   ) 'File storage unit (bytes): ', file_storage_size / character_storage_size
    write( *, '(/,a,i0)' ) 'File storage unit (bits): ', file_storage_size
    write( *, '(a,i0)'   ) 'Character storage unit (bits): ', character_storage_size

    !
    ! Alternatively use the inquire(iolength=) feature
    !
    inquire(iolength=charsize) 'A'
    write( *, '(a,i0)'   ) 'IO-length one character (units): ', charsize

    inquire(iolength=charsize) '0123456789ABCDEF'
    write( *, '(a,i0)'   ) 'IO-length 16 characters (units): ', charsize

end program chk_storage
