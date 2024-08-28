CC = gcc
CFLAGS = -g -Og -std=c11

FC = gfortran
FFLAGS = -g -Og
STDFLAGS = -std=f2008

all: test_gnu.x test_std.x

backtrace_f.o: backtrace_f.F90
	$(FC) $(FFLAGS) -c $< -o $@

backtrace_c.o: backtrace_c.c
	$(CC) $(CFLAGS) -c $< -o $@

test_gnu.x: test.F90
	$(FC) $(FFLAGS) $< -o $@

test_std.x: test.F90 backtrace_f.o backtrace_c.o
	$(FC) $(FFLAGS) $(STDFLAGS) $^ -o $@

clean:
	-rm -f a.out *.x *.o *.mod
	-rm -rf *.dSYM
