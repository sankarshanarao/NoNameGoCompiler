%{
    #include <iostream>
    #include <string>

    extern int linenumber; 
    extern int yylex();
    extern int insertSymbolTable(std::string);
    void yyerror(const char *s) {
    printf("LINE :%d ERROR:%s\n", linenumber, s); 
    }
%}



%token <string> TIDENTIFIER TINTEGER TDOUBLE
%token <token> TCEQ TCNE TCLT TCLE TCGT TCGE TEQUAL TNEG TBAND TBOR TBXOR TAND TOR TLCHAN TRCHAN TSEQUAL
%token <token> TLPAREN TRPAREN TLBRACE TRBRACE TCOMMA TDOT TSEMI
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

program:
    PackageDefinition Stage2
Stage2:
    Imports Stage3
    |
    ;
Stage3:
    Declaration Stage4
    |
    ;
Stage4:
    MainFunc
    |
    ;

// Package
PackageDefinition:
    TKPACKAGE TKMAIN TTERM
    | TKPACKAGE Identifier TTERM
    ;

// Import
 Imports:
     SingleImports TKIMPORT String TTERM
     ;

 SingleImports:
     SingleImports TKIMPORT String TTERM
     |
     ;

// Declaration
Declaration:
    Declaration VariableDecla
    |
    ;

VariableDecla:
    TKVAR Identifier TEQUAL Literal TTERM
    | Identifier TSEQUAL Literal TTERM
    ;

Literal:
    BoolTrue
    | BoolFalse
    | String
    | Float
    | Int
    ;

MainFunc:
    TKFUNC TKMAIN TLPAREN TRPAREN CompoundBloc
    ;

CompoundBloc:
    TLBRACE  TTERM
        StatementList
    TRBRACE TTERM
    ;

//StatementList:
//    Declaration Statementdash
//    | If StatementList
//    ;
StatementList:
    Declaration Statementdash
    ;

Statementdash:
    If Statementdash
    | For Statementdash
    |
    ;

If:
    TKIF TLPAREN ConditionalStatement TRPAREN CompoundBloc
    Else
    ;
Else:
    TKELSE TKIF TLPAREN TRPAREN CompoundBloc Else
    | TKELSE CompoundBloc
    |
    ;

For:
    TKFOR Declaration TSEMI ConditionalStatement TSEMI IterativeStatement CompoundBloc
    | TKFOR Declaration TSEMI ConditionalStatement CompoundBloc
    | TKFOR Declaration CompoundBloc
    ;

ConditionalStatement:
    Operand ConditionalOperator Operand
    ;
ConditionalOperator:
    TCEQ | TCNE | TBAND | TBOR | TBXOR | TAND | TOR
    | TCLE | TCLT | TCGT | TCGE
    ;
Operand:
    Int | Float | Identifier
    ;

ArithmeticStatement:
    IterativeStatement
    ;

IterativeStatement:
    ;

%%
