# ⚙️ Konfiguration
FILENAME ?= hello
OUTDIR = out
ASMFILE = $(FILENAME).asm
OBJFILE = $(OUTDIR)/$(FILENAME).o
BINFILE = $(OUTDIR)/$(FILENAME)

all: $(BINFILE)

$(BINFILE): $(ASMFILE)
	@echo "📦 Baue $(FILENAME)..."
	@mkdir -p $(OUTDIR)
	@nasm -f elf32 $(ASMFILE) -o $(OBJFILE)
	@ld -m elf_i386 $(OBJFILE) -o $(BINFILE)

run: all
	@echo "🚀 Starte $(FILENAME):"
	@echo "----------------------"
	@./$(BINFILE)

clean:
	@echo "🧹 Entferne Ausgabedateien..."
	@rm -rf $(OUTDIR)
