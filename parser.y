%{
    #include <iostream>
    extern int yylex();
    void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

%token <string> TIDENTIFIER TINTEGER TDOUBLE
%token <token> TCEQ TCNE TCLT TCLE TCGT TCGE TEQUAL TNEG TBAND TBOR TBXOR TAND TOR TLCHAN TRCHAN
%token <token> TLPAREN TRPAREN TLBRACE TRBRACE TCOMMA TDOT
%token <token> TPLUS TMINUS TMUL TDIV
%token <token> TKFOR TKIF TKFUNC TKIMPORT TKMAIN TKPACKAGE TKVAR TKELSE
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



//Starting part of parsing...........
program:
    PackageDefinition
    Imports
    Declaration
    MainFunc
    Declaration
    ;
//....................................



//Initial package identifier..........
PackageDefinition: TKPACKAGE TKMAIN
    | TKPACKAGE TIDENTIFIER
    | PackageDefinition '\n'
    ;
//.....................................



//Imports part.........................
Imports:
    SingleImports
    ;
SingleImports:
    SingleImportsDash
    ;
SingleImportsDash:
    TKIMPORT String '\n' SingleImportsDash
    |
    ;
//......................................



//Entire part for declarations
Declaration:
    Declarationdash
    ;

Declarationdash:
    VariableDecla  Declarationdash
    |
    ; 

VariableDecla:
    Identifier TEQUAL Literal '\n'
    ;

ConditionalExp:
    ;
//............................................



//Miscellaneous..............................
Literal:
    BoolTrue
    | BoolFalse
    | String
    | Float
    | Int
    ;
//...........................................



//Main and it's immediate inside...............
MainFunc:
    TKFUNC TKMAIN TLPAREN TRPAREN CompoundBloc
    ;

CompoundBloc:
    TLBRACE  '\n'  
        StatementList
    TRBRACE CompoundBloc
    | '\n'
    |
    ;

StatementList:
    StatementList Statement
    |
    ;

Statement:
    Declaration
    | For
    | If
    ;
//...............................................



//for implementation.............................
For:
    TKFOR TLPAREN  TRPAREN CompoundBloc
    ;
//...............................................



//if else implementation.........................
If:
    TKIF TLPAREN TRPAREN CompoundBloc
    Else
    ;

//To eliminate left recursion
Else:
    TKELSE TKIF TLPAREN TRPAREN CompoundBloc
    Else
    | TKELSE CompoundBloc
    |
    ;
//...............................................


%%