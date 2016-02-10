CC = gcc
CFLAGS = -O2 -Wall -I .

# This flag includes the Pthreads library on a Linux box.
# Others systems will probably require something different.
LIB = -lpthread -ldl

all: optimized baseline cgi

optimized: optimized.c csapp.o
	$(CC) $(CFLAGS) -o optimized optimized.c csapp.o $(LIB)

baseline: baseline.c csapp.o
	$(CC) $(CFLAGS) -o baseline baseline.c csapp.o $(LIB)

csapp.o: csapp.c
	$(CC) $(CFLAGS) -c csapp.c

cgi:
	(cd cgi-bin; make)

clean:
	rm -f *.o optimized baseline *~
	(cd cgi-bin; make clean)

