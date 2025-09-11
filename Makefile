###############################################################
# GNU Makefile for LinuxDoom-Plus
###############################################################

CC      := gcc
CFLAGS  := -g -Wall
LDFLAGS :=
LIBS    := -lSDL2_net -lSDL2 -lSDL2_mixer -lm

O = linux

SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,$(O)/%.o,$(SRCS))

TXT_SRCS := $(wildcard TEXTSCREEN/*.c)
TXT_OBJS := $(patsubst TEXTSCREEN/%.c,TEXTSCREEN/%.o,$(TXT_SRCS))
TXT_LIB  := TEXTSCREEN/libtextscreen.a

all: $(O)/linuxdoom-plus

$(O)/linuxdoom-plus: $(OBJS) $(TXT_LIB)
	$(CC) $(CFLAGS) $(OBJS) -L TEXTSCREEN -ltextscreen \
	-o $@ $(LDFLAGS) $(LIBS)

$(TXT_LIB): $(TXT_OBJS)
	$(AR) rcs $@ $^

$(O)/%.o: %.c | object
	$(CC) $(CFLAGS) -c $< -o $@

TEXTSCREEN/%.o: TEXTSCREEN/%.c
	$(CC) $(CFLAGS) -I TEXTSCREEN -c $< -o $@

object:
	mkdir -p $(O)

clean:
	rm -f $(O)/*.o $(O)/linuxdoom-plus
	rm -f TEXTSCREEN/*.o TEXTSCREEN/libtextscreen.a
	rm -f *~ TEXTSCREEN/*~

.PHONY: all clean object
