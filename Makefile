###############################################################
# GNU Makefile for LinuxDoom-Plus
###############################################################

CC      := gcc
CFLAGS  := -g -Wall -DNORMALUNIX -DLINUX
LDFLAGS :=
LIBS    := -lSDL2_net -lSDL2 -lSDL2_mixer -lm

O       = linux
SRC     = src

SRCS    := $(wildcard $(SRC)/*.c)
OBJS    := $(patsubst $(SRC)/%.c,$(O)/%.o,$(SRCS))

TXT_SRCS := $(wildcard $(SRC)/TEXTSCREEN/*.c)
TXT_OBJS := $(patsubst $(SRC)/TEXTSCREEN/%.c,$(SRC)/TEXTSCREEN/%.o,$(TXT_SRCS))
TXT_LIB  := $(SRC)/TEXTSCREEN/libtextscreen.a

all: $(O)/linuxdoom-plus

$(O)/linuxdoom-plus: $(OBJS) $(TXT_LIB)
	$(CC) $(CFLAGS) $(OBJS) -L $(SRC)/TEXTSCREEN -ltextscreen \
	-o $@ $(LDFLAGS) $(LIBS)

$(TXT_LIB): $(TXT_OBJS)
	$(AR) rcs $@ $^

$(O)/%.o: $(SRC)/%.c | object
	$(CC) $(CFLAGS) -c $< -o $@

TEXTSCREEN/%.o: $(SRC)/TEXTSCREEN/%.c
	$(CC) $(CFLAGS) -I $(SRC)/TEXTSCREEN -c $< -o $@

object:
	mkdir -p $(O)

clean:
	rm -f $(O)/*.o $(O)/linuxdoom-plus
	rm -f TEXTSCREEN/*.o TEXTSCREEN/libtextscreen.a
	rm -f *~ TEXTSCREEN/*~

.PHONY: all clean object

