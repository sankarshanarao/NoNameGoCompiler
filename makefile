all: 
	bison -d -o parser.cpp parser.y -v -t --report='all'
	flex -o tokens.cpp tokens.l
	g++ -o parser parser.cpp tokens.cpp main.cpp -ll