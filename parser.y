%{
    #include <iostream>
    #include <string>

    extern int yylex();
    extern int insertSymbolTable(std::string);
    void yyerror(const char *s) { printf("ERROR: %s:", s); }
%}

%token <string> TIDENTIFIER TINTEGER TDOUBLE
%token <token> TCEQ TCNE TCLT TCLE TCGT TCGE TEQUAL TNEG TBAND TBOR TBXOR TAND TOR TLCHAN TRCHAN
%token <token> TLPAREN TRPAREN TLBRACE TRBRACE TCOMMA TDOT
%token <token> TPLUS TMINUS TMUL TDIV
%token <token> TKFOR TKIF TKFUNC TKIMPORT TKMAIN TKPACKAGE TKVAR TKELSE
%token <token> TDINT TDFLOAT TDBOOL TDSTRING
%token <token> BoolTrue BoolFalse String Float Int MultiCommentBegin MultiCommentEnd Identifier
%token <token> TTERM

%union {
    std::string *string;
    int token;
}

%left TPLUS TMINUS
%left TMUL TDIV

%start program

%%

// program:
//     PackageDefinition
//     Imports
//     | {
//         std::cout<<"Empty File"<<std::endl;
//     }
//     ;

program:
    PackageDefinition
    // Imports
    ;

// Package
PackageDefinition:
    TKPACKAGE TKMAIN TTERM
    | TKPACKAGE Identifier TTERM
    ;

// Imports:
//     SingleImports
//     // | MultiImports
//     ;

// SingleImports:
//     SingleImports TKIMPORT String TTERM
//     ;

// MultiImports:
//     TKIMPORT TLPAREN TTERM
//     ;

%%