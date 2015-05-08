# vim: ft=make tw=78 sw=4 ts=4 noet
VERSIONS := v14.01.1
MKDIR := mkdir
SED := sed

.DEFAULT: default

default: $(VERSIONS)

v%: src/Dockerfile $(MAKEFILE)
	@$(MKDIR) -p $*
	@$(SED) -e s/\<VERSION\>/$*/g < $< > $*/Dockerfile
