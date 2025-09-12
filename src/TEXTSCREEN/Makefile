# Makefile for TEXTSCREEN

# Compiler and flags
CC      := gcc
CFLAGS  := -Wall -Wextra -O2 -g -I. `sdl2-config --cflags`
AR      := ar
ARFLAGS := rcs

# Output
TARGET  := libtextscreen.a

# Sources and objects
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

# Default rule
all: $(TARGET)

# Build static library
$(TARGET): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

# Compile .c to .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean
clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean

