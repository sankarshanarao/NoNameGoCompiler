%{
    #include <iostream>
    #include <string>
    #include "ast-node.h"

    extern int linenumber; 
    extern int yylex();
    extern int insertSymbolTable(std::string);
    void yyerror(const char *s) {
    printf("LINE :%d ERROR:%s\n", linenumber, s); 
    }

    using namespace std;
    extern int insertSymbolTable(string s);
    extern int definedBefore(string s);
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

%type <string> Literal

%left TPLUS TMINUS
%left TMUL TDIV

%start program

%%

program:
    PackageDefinition Imports Declaration MainFunc
    | PackageDefinition Declaration MainFunc
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
    TKVAR Identifier TEQUAL Literal TTERM {
        cout<<"VarDeclTrial:"<<$2<<endl;
    }
    | Identifier TSEQUAL Literal TTERM {
        // string s = $3;
        cout<<"VarDeclTrial:"<<*$3<<endl;
    }
    ;

Literal:
    BoolTrue {
        $$ = new string("hello");
        cout<<"literal:"<<$1;
    }
    | BoolFalse {
        $$ = new string("hello");
    }
    | String {
        $$ = new string("hello");
    }
    | Float {
        $$ = new string("hello");
    }
    | Int {
        $$ = new string("hello");
    }
    ;

MainFunc:
    TKFUNC TKMAIN TLPAREN TRPAREN CompoundBloc {
        std::cout<<"MainFunction"<<std::endl;
    }
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
    TKELSE TKIF TLPAREN ConditionalStatement TRPAREN CompoundBloc Else
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
    | TCLE | TCLT | TCGT | TCGE | TNEG
    ;
Operand:
    Int | Float | Identifier
    ;

IterativeStatement: 
    AssignmentStatement;

AssignmentStatement: 
    Identifier TEQUAL ArithmeticStatement;

ArithmeticStatement: 
    Identifier ArithOper Identifier
    | Identifier ArithOper Literal
    | Literal ArithOper Identifier
    | Literal ArithOper Literal
    ;

ArithOper: 
    TMINUS
    | TPLUS
    | TMUL
    | TDIV
    ;
%%
