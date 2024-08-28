FC = gfortran
FFLAGS = -g -Og
STDFLAGS = -std=f2008

all: test_gnu.x test_std.x backtrace.o

backtrace.o: backtrace.F90
	$(FC) $(FFLAGS) -c $< -o $@

test_gnu.x: test.F90
	$(FC) $(FFLAGS) $< -o $@

test_std.x: test.F90 backtrace.o
	$(FC) $(FFLAGS) $(STDFLAGS) $< backtrace.o -o $@

clean:
	-rm -f a.out *.x *.o *.mod
	-rm -rf *.dSYM
