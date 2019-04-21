#include <iostream>
#include <vector>

class NStatement;
class NExpression;
class NVariableDeclaration;

typedef std::vector<NStatement*> StatementList;
typedef std::vector<NExpression*> ExpressionList;
typedef std::vector<NVariableDeclaration*> VariableList;
typedef std::vector<std::string> StringVec;

class Node {
    public:
        virtual ~Node() {}
};

class NExpression : public Node {
    public:
        virtual char typeOf() {
            return 'u';
        };
};

class NStatement : public Node {
    public:
        virtual int printJSON() {
            return 0;
        };
};

class NInteger: public NExpression {
    public:
        long long int value;
        NInteger(long long int value): value(value) { }
        
        virtual char typeOf() {
            return 'i';
        }
};

class NFloat: public NExpression {
    public:
        double value;
        NFloat(double value): value(value) { }
        
        virtual char typeOf() {
            return 'f';
        }
};

class NString: public NExpression {
    public:
        std::string value;
        NString(std::string &value): value(value) {}

        virtual char typeOf() {
            return 's';
        }
};

class NBool: public NExpression {
    public:
        char value;
        NBool(char value): value(value) {}

        virtual char typeOf() {
            return 'b';
        }
};

class NIdentifier: public NExpression {
    public:
        std::string name;
        NIdentifier(std::string &name): name(name) { }

        virtual int printJSON() const{
        std::cout<<name;
        return 0;
    }
};

class NBinOp: public NExpression {
    public:
        // enum type {
        //     BPlus, BMinus, BMulti, BDivid,
        //     BEqualEqual, BNotEqual,
        //     BBitAnd, BBitOr, BBitXor,
        //     BCoAnd, BCoOor,
        //     BChanIn, BChanOut,
        //     BGreT, BGretEq,
        //     BLesT, BLesTEq,
        // };

        int type;
        NExpression &op1, &op2;
        NBinOp(NExpression &op1, int type, NExpression &op2): 
            type(type), op1(op1), op2(op2) { }
};

class NAssign: public NExpression {
    public:
        NIdentifier &lhs;
        NExpression &rhs;

        NAssign(NIdentifier &lhs, NExpression &rhs): lhs(lhs), rhs(rhs) { }
};

class NBlock : public NExpression {
public:
    StatementList statements;
    NBlock() { }
};

class NExpressionStatement : public NStatement {
public:
    NExpression &expression;
    NExpressionStatement(NExpression &expression) : 
        expression(expression) { }
};

class NVariableDeclaration : public NStatement {
public:
    const NIdentifier &type;
    NIdentifier &id;
    NExpression *assignmentExpr;
    NVariableDeclaration(const NIdentifier& type, NIdentifier& id) :
        type(type), id(id) { }
    NVariableDeclaration(const NIdentifier &type, NIdentifier &id, NExpression *assignmentExpr) :
        type(type), id(id), assignmentExpr(assignmentExpr) { }
    
    virtual int printJSON() {

        std::cout<<"{\"opt\":\"varDecl\", \"type\":"<<"\"";
        type.printJSON();
        std::cout<<"\",";

        std::cout<<"\"id\":"<<"\"";
        id.printJSON();
        std::cout<<"\"";

        std::cout<<"}";
        return 0;
    }
};

class NGlobalBlock : public NBlock {
    public:
        std::string packageName;
        std::vector<std::string> imports;
        StatementList GlobDecl;
        NBlock *mainBlock;

        int printJSON() {
            std::cout<<"{ \"package\": \""<<packageName<<"\","<<std::endl;

            return 0;
        }
};