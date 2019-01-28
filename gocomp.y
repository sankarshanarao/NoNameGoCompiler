start:	
	Function 
	| Declaration
;

StmtList: 
	StmtList Stmt
	|
;

Stmt: 
	Declaration
	| ForStmt
	| IfStmt
	| PrintFunc
	| '\n'
; 

Expr:	
	
	| Expr LE Expr 
	| Expr GE Expr
	| Expr NE Expr
	| Expr EQ Expr
	| Expr GT Expr
	| Expr LT Expr
	| ID++
	| ID--
	| ++ID
	| --ID
	| Assignment
;

ForStmt: 
	FOR SPACETOK "{" "\n"
	StmtList 
	"}"
	| 
	FOR SPACETOK Expr SPACETOK"{" "\n"
	StmtList 
	"}"
	| 
	FOR SPACETOK Stmt ";" Expr ";" Expr SPACETOK"{" "\n"
	StmtList 
	"}"
	;

IfStmt : 
	IF SPACETOK Expr SPACETOK "{\s*\n" 
	 	StmtList
	"}"
;

PrintFunc : 
	FMTPRINTLN '(' Expr ')'

Declaration:
	ID ":=" Assignment
	;
	
Assignment: 
	ID '=' Assignment
	| ID '+' Assignment
	| ID '-' Assignment
	| ID '*' Assignment
	| ID '/' Assignment	
	| NUM '+' Assignment
	| NUM '-' Assignment
	| NUM '*' Assignment
	| NUM '/' Assignment
	| '-' NUM
	| '-' ID
	|   NUM
	|   ID
	;
