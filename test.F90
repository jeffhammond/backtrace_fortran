subroutine bar
    call backtrace
end subroutine bar

subroutine foo
    call bar
end subroutine foo

program main
    call foo
end program main
