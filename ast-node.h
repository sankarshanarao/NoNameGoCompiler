#include <iostream>
#include <vector>

class NStatement;
class NExpression;
class NVariableDeclaration;

typedef std::vector<NStatement*> StatementList;
typedef std::vector<NExpression*> ExpressionList;
typedef std::vector<NVariableDeclaration*> VariableList;

class Node {
    public:
        virtual ~Node() {}
};

class NExpression : public Node {
};

class NStatement : public Node {
};

class NInteger: public NExpression {
    public:
        long long int value;
        NInteger(long long int value): value(value) { }
};

class NFloat: public NExpression {
    public:
        double value;
        NFloat(double value): value(value) { }
};

class NString: public NExpression {
    public:
        std::string value;
        NString(std::string &value): value(value) {}
};

class NBool: public NExpression {
    public:
        char value;
        NBool(char value): value(value) {}
};

class NIdentifier: public NExpression {
    public:
        std::string name;
        NIdentifier(std::string &name): name(name) { }
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
};