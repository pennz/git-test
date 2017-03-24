__DEBUG_MAKEFILE__ := 
OBJS =  main.o foobar.o foo.o bar.o

define require
$(1) : $(1:%.o=%.c) $(1:%.o=%.h)
endef

main : $(OBJS) 

$(foreach obj, $(OBJS), $(eval $(call require, $(obj))))

main.o: foobar.h foo.h bar.h

foobar.o: foo.h bar.h

.PHONY : clean

clean : 
	-rm *.o main

ifdef __DEBUG_MAKEFILE__

VALUE_T := $(call require, main.o)

print-%:
	@echo '$*=$($*)'
endif
