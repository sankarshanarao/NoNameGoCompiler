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
%token <string> BoolTrue BoolFalse String Float Int MultiCommentBegin MultiCommentEnd Identifier
%token <token> TTERM

%union {
    Node *node;
    NStatement *stmt;
    StatementList *gDeclLst;
    std::string *string;
    NExpression *expr;
    int token;
}

// %type <string> Literal
%type <expr> Literal
%type <stmt> VariableDecla
%type <gDeclLst> Declaration

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
    VariableDecla Declaration { 
        cout<<"VarDecls"<<endl;
        $2->push_back($<stmt>1);
    }
    | { 
        NStatement *simply = new NStatement();
        $$ = new StatementList();
        // $$->push_back(simply); 
        cout<<"DeclEnd"<<endl; 
    }
    ;

VariableDecla:
    TKVAR Identifier TEQUAL Literal TTERM {
        string *typeS;
        // cout<<"VarDeclTrial2type:"<<$4->typeOf()<<endl;
        switch($4->typeOf()) {
            case 'u': typeS = new std::string("unk"); break;
            case 'i': typeS = new std::string("int"); break;
            case 'f': typeS = new std::string("float"); break;
            case 's': typeS = new std::string("string"); break;
            case 'b': typeS = new std::string("bool"); break;
        }
        
        NIdentifier *typE = new NIdentifier(*typeS);
        NIdentifier *id = new NIdentifier(*$2);
        delete $2;
        $$ = new NVariableDeclaration(*typE, *id, $4);
    }
    | Identifier TSEQUAL Literal TTERM {
        string *typeS;
        // cout<<"VarDeclTrial2type:"<<$3->typeOf()<<endl;
        switch($3->typeOf()) {
            case 'u': typeS = new std::string("unk"); break;
            case 'i': typeS = new std::string("int"); break;
            case 'f': typeS = new std::string("float"); break;
            case 's': typeS = new std::string("string"); break;
            case 'b': typeS = new std::string("bool"); break;
        }
        
        NIdentifier *typE = new NIdentifier(*typeS);
        NIdentifier *id = new NIdentifier(*$1);
        delete $1;
        $$ = new NVariableDeclaration(*typE, *id, $3);
    }
    ;

Literal:
    BoolTrue {
        $$ = new NBool('T');
    }
    | BoolFalse {
        $$ = new NBool('T');
    }
    | String {
        cout<<*$1<<endl;
        $$ = new NString(*$1);
    }
    | Float {
        double fl = atof($1->c_str());
        $$ = new NFloat(fl);
        cout<<fl<<endl;
    }
    | Int {
        long long int v = atoi($1->c_str());
        $$ = new NInteger(v);
        cout<<v<<endl;
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
    | Statementdash 
    | StatementList Statementdash 
    ;

Statementdash:
    If 
    | For 
    | VariableDecla
    ;

If:
    TKIF ConditionalStatement CompoundBloc
    Else
    ;
Else:
    TKELSE If
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
