CC = gcc
CFLAGS = -O2 -Wall -I ..
CSO = -O2 -shared -fPIC

all: adder adder_so

adder: adder.c
	$(CC) $(CFLAGS) -o adder adder.c

adder_so: adder_lib.c
	$(CC) $(CSO) -o adder_lib.so adder_lib.c

clean:
	rm -f adder adder_lib.so *~
