!
! Distributed under the OSI-approved Apache License, Version 2.0.  See
!  accompanying file Copyright.txt for details.
!
!  adios2_fwrite.f90 : ADIOS2 Fortran bindings implementation for
!                          high-level API Write functions
!
!   Created on: Mar 1st, 2018
!       Author: William F Godoy godoywf@ornl.gov
!

! Single Value and Step
subroutine adios2_fread_steps_real(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real, intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_real, data, &
                                     step_selection, ierr)
end subroutine

subroutine adios2_fread_steps_dp(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real(kind=8), intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_dp, data, &
                                     step_selection, ierr)
end subroutine

subroutine adios2_fread_steps_complex(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex, intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_complex, data, &
                                     step_selection, ierr)
end subroutine

subroutine adios2_fread_steps_complex_dp(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex(kind=8), intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_complex_dp, data, &
                                     step_selection, ierr)
end subroutine

subroutine adios2_fread_steps_integer1(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=1), intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_integer1, data, &
                                     step_selection, ierr)
end subroutine

subroutine adios2_fread_steps_integer2(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=2), intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_integer2, data, &
                                     step_selection, ierr)
end subroutine

subroutine adios2_fread_steps_integer4(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=4), intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_integer4, data, &
                                     step_selection, ierr)
end subroutine

subroutine adios2_fread_steps_integer8(unit, name, data, step_selection, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=8), intent(out) :: data
    integer(kind=8), intent(in) :: step_selection
    integer, intent(out) :: ierr

    call adios2_fread_value_step_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                     adios2_type_integer8, data, &
                                     step_selection, ierr)
end subroutine


! 1D arrays
subroutine adios2_fread_steps_real_1d(unit, name, data, selection_start_dims, &
                                      selection_count_dims, step_selection_start, &
                                      step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real, dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_real, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_dp_1d(unit, name, data, selection_start_dims, &
                                    selection_count_dims, step_selection_start, &
                                    step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real(kind=8), dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_dp, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_1d(unit, name, data, selection_start_dims, &
                                         selection_count_dims, step_selection_start, &
                                         step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex, dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_dp_1d(unit, name, data, selection_start_dims, &
                                            selection_count_dims, step_selection_start, &
                                            step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex(kind=8), dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex_dp, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer1_1d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=1), dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer1, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer2_1d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=2), dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer2, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer4_1d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=4), dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer4, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer8_1d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=8), dimension(:), allocatable, intent(out) :: data
    integer(kind=8), dimension(1), intent(in) :: selection_start_dims
    integer(kind=8), dimension(1), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(1) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer8, data, 1, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

! 2D arrays
subroutine adios2_fread_steps_real_2d(unit, name, data, selection_start_dims, &
                                      selection_count_dims, step_selection_start, &
                                      step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real, dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_real, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_dp_2d(unit, name, data, selection_start_dims, &
                                    selection_count_dims, step_selection_start, &
                                    step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real(kind=8), dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_dp, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_2d(unit, name, data, selection_start_dims, &
                                         selection_count_dims, step_selection_start, &
                                         step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex, dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_dp_2d(unit, name, data, selection_start_dims, &
                                            selection_count_dims, step_selection_start, &
                                            step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex(kind=8), dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex_dp, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer1_2d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=1), dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer1, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer2_2d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=2), dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer2, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer4_2d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=4), dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer4, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer8_2d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=8), dimension(:, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(2), intent(in) :: selection_start_dims
    integer(kind=8), dimension(2), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(2) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer8, data, 2, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

! 3D arrays
subroutine adios2_fread_steps_real_3d(unit, name, data, selection_start_dims, &
                                      selection_count_dims, step_selection_start, &
                                      step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real, dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_real, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_dp_3d(unit, name, data, selection_start_dims, &
                                    selection_count_dims, step_selection_start, &
                                    step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real(kind=8), dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_dp, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_3d(unit, name, data, selection_start_dims, &
                                         selection_count_dims, step_selection_start, &
                                         step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex, dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_dp_3d(unit, name, data, selection_start_dims, &
                                            selection_count_dims, step_selection_start, &
                                            step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex(kind=8), dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex_dp, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer1_3d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=1), dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer1, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer2_3d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=2), dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer2, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer4_3d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=4), dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer4, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer8_3d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=8), dimension(:, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(3), intent(in) :: selection_start_dims
    integer(kind=8), dimension(3), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(3) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer8, data, 3, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

! 4D arrays
subroutine adios2_fread_steps_real_4d(unit, name, data, selection_start_dims, &
                                      selection_count_dims, step_selection_start, &
                                      step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real, dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_real, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_dp_4d(unit, name, data, selection_start_dims, &
                                    selection_count_dims, step_selection_start, &
                                    step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real(kind=8), dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_dp, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_4d(unit, name, data, selection_start_dims, &
                                         selection_count_dims, step_selection_start, &
                                         step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex, dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_dp_4d(unit, name, data, selection_start_dims, &
                                            selection_count_dims, step_selection_start, &
                                            step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex(kind=8), dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex_dp, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer1_4d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=1), dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer1, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer2_4d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=2), dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer2, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer4_4d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=4), dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer4, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer8_4d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=8), dimension(:, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(4), intent(in) :: selection_start_dims
    integer(kind=8), dimension(4), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(4) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer8, data, 4, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

! 5D arrays
subroutine adios2_fread_steps_real_5d(unit, name, data, selection_start_dims, &
                                      selection_count_dims, step_selection_start, &
                                      step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real, dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_real, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_dp_5d(unit, name, data, selection_start_dims, &
                                    selection_count_dims, step_selection_start, &
                                    step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real(kind=8), dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_dp, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_5d(unit, name, data, selection_start_dims, &
                                         selection_count_dims, step_selection_start, &
                                         step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex, dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_dp_5d(unit, name, data, selection_start_dims, &
                                            selection_count_dims, step_selection_start, &
                                            step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex(kind=8), dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex_dp, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer1_5d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=1), dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer1, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer2_5d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=2), dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer2, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer4_5d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=4), dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer4, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer8_5d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=8), dimension(:, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(5), intent(in) :: selection_start_dims
    integer(kind=8), dimension(5), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(5) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer8, data, 5, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

! 6D arrays
subroutine adios2_fread_steps_real_6d(unit, name, data, selection_start_dims, &
                                      selection_count_dims, step_selection_start, &
                                      step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real, dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_real, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_dp_6d(unit, name, data, selection_start_dims, &
                                    selection_count_dims, step_selection_start, &
                                    step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    real(kind=8), dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_dp, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_6d(unit, name, data, selection_start_dims, &
                                         selection_count_dims, step_selection_start, &
                                         step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex, dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_complex_dp_6d(unit, name, data, selection_start_dims, &
                                            selection_count_dims, step_selection_start, &
                                            step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    complex(kind=8), dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_complex_dp, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer1_6d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=1), dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer1, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer2_6d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=2), dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer2, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer4_6d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=4), dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer4, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

subroutine adios2_fread_steps_integer8_6d(unit, name, data, selection_start_dims, &
                                          selection_count_dims, step_selection_start, &
                                          step_selection_count, ierr)
    type(adios2_file), intent(in):: unit
    character*(*), intent(in) :: name
    integer(kind=8), dimension(:, :, :, :, :, :), allocatable, intent(out) :: data
    integer(kind=8), dimension(6), intent(in) :: selection_start_dims
    integer(kind=8), dimension(6), intent(in) :: selection_count_dims
    integer(kind=8), intent(in) :: step_selection_start
    integer(kind=8), intent(in) :: step_selection_count
    integer, intent(out) :: ierr

    integer(kind=8), dimension(6) :: selection_shape_total
    selection_shape_total = selection_count_dims*step_selection_count
    call adios2_allocate(data, selection_shape_total, ierr)

    if (ierr == 0) then
        call adios2_fread_steps_f2c(unit%f2c, TRIM(ADJUSTL(name))//char(0), &
                                    adios2_type_integer8, data, 6, &
                                    selection_start_dims, &
                                    selection_count_dims, &
                                    step_selection_start, &
                                    step_selection_count, ierr)
    end if

end subroutine

