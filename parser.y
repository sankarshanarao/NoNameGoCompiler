%{
    #include <iostream>
    /*
    #include "node.h"
    NBlock *programBlock; *//* the top level root node of our final AST */

    extern int yylex();
    void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

%token <string> TIDENTIFIER TINTEGER TDOUBLE
%token <token> TCEQ TCNE TCLT TCLE TCGT TCGE TEQUAL TNEG TBAND TBOR TBXOR TAND TOR TLCHAN TRCHAN
%token <token> TLPAREN TRPAREN TLBRACE TRBRACE TCOMMA TDOT
%token <token> TPLUS TMINUS TMUL TDIV
%token <token> TKFOR TKIF TKFUNC TKIMPORT TKMAIN TKPACKAGE TKVAR
%token <token> TDINT TDFLOAT TDBOOL TDSTRING
%token <token> BoolTrue BoolFalse String Float Int MultiCommentBegin MultiCommentEnd Identifier

%union {
    std::string *string;
    int token;
}

%left TPLUS TMINUS
%left TMUL TDIV

%start program

%%
program:
    PackageDefinition '\n'
    ;

PackageDefinition: TKPACKAGE TKMAIN
    | TKPACKAGE TIDENTIFIER
    ;
%%