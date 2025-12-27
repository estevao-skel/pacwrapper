NASM = nasm
LD = ld


ASMFLAGS = -f elf64 -g -F dwarf

LDFLAGS = -dynamic-linker /lib64/ld-linux-x86-64.so.2 \
          -L/usr/lib -L/usr/lib/x86_64-linux-gnu \
          -lgtk-3 -lgdk-3 -lgobject-2.0 -lglib-2.0 -lc


TARGET = pacwrapper
SRC = pacwrapper.asm
OBJ = pacwrapper.o

all: $(TARGET)

$(TARGET): $(OBJ)
	@echo " link $(TARGET)"
	$(LD) -o $(TARGET) $(OBJ) $(LDFLAGS)

$(OBJ): $(SRC)
	@echo "compilando $(SRC)"
	$(NASM) $(ASMFLAGS) $(SRC) -o $(OBJ)

clean:
	@echo "limpou"
	rm -f $(OBJ) $(TARGET)

run: $(TARGET)
	./$(TARGET)
