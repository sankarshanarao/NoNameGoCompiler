# all: 
# 	bison -d -o parser.cpp parser.y -v -t --report='all'
# 	flex -o tokens.cpp tokens.l
# 	g++ -o parser parser.cpp tokens.cpp main.cpp -ll

all: parser

clean:
	rm parser.cpp parser.hpp parser tokens.cpp

parser.cpp: parser.y
	bison -d -o parser.cpp parser.y -v -t --report='all'

parser.hpp: parser.cpp

tokens.cpp: tokens.l parser.hpp
	flex -o tokens.cpp tokens.l

parser: parser.cpp main.cpp tokens.cpp
	g++ -o parser parser.cpp tokens.cpp main.cpp -ll
