CC = gcc
LFLAGS = -lm

SOURCES = $(wildcard *.c)
OBJECTS = $(subst .c,.o,$(SOURCES))

.PHONY: clean

all : coolness 

coolness : coolness.o
	$(CC) $(LFLAGS) -o coolness $(OBJECTS) -lm

%.o : %.c
	$(CC) -c $<

clean:
	rm $(OBJECTS) coolness


