TARGET = main

CC = gcc
SRC = main.c fpcap.c
OBJ = $(patsubst %.c,%.o,$(SRC))

CFLAGS += -g -Wall -I./
LDFLAGS += -Wl,-rpath -lpcap

all: $(OBJ)
	$(CC) $(LDFLAGS) -o $(TARGET) $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: all clean

clean:
	rm -f $(TARGET) $(OBJ)