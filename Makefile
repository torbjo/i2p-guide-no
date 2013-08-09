MARKDOWN=markdown_py
#MARKDOWN=markdown_py -o html5

all: install-i2p.html
	xdg-open $^

# This file is found under:
upload: install-i2p.html
	echo nop
	#scp $^ example.net:/path/to/file.html

clean:
	rm -rf install-i2p.html

# Suffix rule from markdown to html
%.html : %.md
	$(MARKDOWN) $< | sed -e "s/@@LAST-UPDATE@@/`date --iso`/" > $@
#	$(MARKDOWN) $< > $@
