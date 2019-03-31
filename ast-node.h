#include <iostream>
#include <vector>

class Expression
{

};

class Statement
{

};

class Integer
{   
    public:
    long long int value;

    Integer(long long int value) : value(value) { }
};

class Float
{
    public:
    double value;

    Float(double value): value(value) {}
};

class String
{
    public:
    std::string value;

    String(std::string& value): value(value) {}
};

class Identifier
{
    public:
    std::string name;

    Identifier(std::string& name): name(name) {}
};

class BinOp
{
    public:
    // enum op {
    //     EqualEqual, NotEqual, 
    //     BitAnd, BitOr, BitXor,
    //     CoAnd, CoOr, 
    //     ChanIn, ChanOut,
    //     Greater, GreaterEqual, Lesser, LesserEqual,
    //     Plus, Minus, Multiply, Divide
    // };
    
    int oper;

    Expression &op1, &op2;

    BinOp(Expression &op1, int oper, Expression &op2):
        op1(op1), op2(op2), oper(oper) {}
     
};

class Assignment
{
    public:

    Identifier &lhs;
    Expression &rhs;

    Assignment(Identifier &lhs, Expression &rhs): 
        lhs(lhs), rhs(rhs) {}
};

class Block
{
    public:
    std::vector <Statement *> statements;
};

class VarDecl
{
    public:
    int type;
    Identifier &id;
    Expression &rhs;

    VarDecl(int type, Identifier &id, Expression &rhs):
        type(type), id(id), rhs(rhs) {}
};

class ProgBloc
{   
    public:
    std::string packageName;

    std::vector <std::string> imports;

    Block &mainBloc;

    ProgBloc(std::string &packageName, std::vector <std::string> &imports, Block &block):
        packageName(packageName), imports(imports), mainBloc(block) {}

};

