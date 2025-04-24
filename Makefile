# ⚙️ Konfiguration
FILENAME ?= hello
OUTDIR = out
SRCDIR = src/
PRJDIR = projects/
ASMFILE = $(FILENAME).asm
OBJFILE = $(OUTDIR)/$(FILENAME).o
BINFILE = $(OUTDIR)/$(FILENAME)

# Finde Datei in SRCDIR oder PRJDIR
ASMFILE_PATH := $(shell [ -f $(SRCDIR)$(ASMFILE) ] && echo $(SRCDIR)$(ASMFILE) || echo $(PRJDIR)$(ASMFILE))

all: $(BINFILE)

$(BINFILE): $(ASMFILE_PATH)
	@echo "📦 Baue $(FILENAME)..."
	@mkdir -p $(OUTDIR)
	@nasm -f elf32 $< -o $(OBJFILE)
	@ld -m elf_i386 $(OBJFILE) -o $(BINFILE)

run: all
	@echo "🚀 Starte $(FILENAME):"
	@echo "----------------------"
	@./$(BINFILE)

clean:
	@echo "🧹 Entferne Ausgabedateien..."
	@rm -rf $(OUTDIR)
