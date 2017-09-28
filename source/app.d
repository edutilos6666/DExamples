import std.stdio;
import Person;
import std.format;
import Box ;
import DatabaseExample;
import MysqlExample;
import InterfaceExample;
import ComplexNumber;
import EnumExample;
import OperatorsExample;
import LoopExample;
import DecisionMakingExample;
import FunctionsExample;
import CharactersExample;
import StringsExample;
import ArrayExample;
import TupleExample;
import StructExample;
import UnionExample;
//import database;
import RangeExample;
import TemplateExample;
import ImmutableExample;
import FileIOExample;
import ExceptionExample;
import ConditionalCompilationExample;
import JSONExample;
import XMLExample;
import MongoExample;


void testPersonDAO();
void testBox();
void testDatabaseExample();
void testMysqlExample();
void testInterfaceExample();
void testComplexNumber();
void testEnumExample();
void testOperatorsExample();
void testLoopExample();
void testDecisionMakingExample();
void testFunctionsExample();
void testCharactersExample();
void testStringsExample();
void testArrayExample();
void testTupleExample();
void testStructExample();
void testUnionExample();
void testRangeExample();
void testTemplateExample();
void testImmutableExample();
void testFileIOExample();
void testExceptionExample();
void testConditionalCompilationExample();
void testJSONExample();
void testXMLExample();
void testMongoExample();


void main()
{
	testMongoExample();
}


void testMongoExample()  {
   MongoExample mrunner = new MongoExample();
   //mrunner.example1();
   mrunner.example2();
}

void testXMLExample() {
    XMLExample xrunner = new XMLExample();
    //xrunner.example1();
    xrunner.example2();
}


void testJSONExample() {
   JSONExample jrunner = new JSONExample();
   //jrunner.example1();
   jrunner.example2();
}


void testConditionalCompilationExample() {
   ConditionalCompilationExample ccrunner = new ConditionalCompilationExample();
   //ccrunner.example1();
   ccrunner.example2();
}


void testExceptionExample()  {
    ExceptionExample erunner = new ExceptionExample();
    erunner.example1();
}


void testFileIOExample() {
    FileIOExample frunner = new FileIOExample();
    frunner.example1();
}

void testImmutableExample()  {
   ImmutableExample irunner = new ImmutableExample();
   //irunner.example1();
   //irunner.example2();
   irunner.example3();
}

void testTemplateExample() {
    TemplateExample trunner = new TemplateExample();
    //trunner.example1();
    trunner.example2();
}

void testRangeExample() {
    RangeExample rrunner = new RangeExample();
    //rrunner.testInputRange();
    //rrunner.testForwardRange();
    //rrunner.testBidirectionalRange();
    //rrunner.testInfiniteRandomAccessRange();
    rrunner.testOutputRange();
}


void testUnionExample() {
    UnionExample runner = new UnionExample();
    runner.example1();
}

void testStructExample() {
    StructExample runner = new StructExample();
    runner.example1();
}

void testTupleExample() {
    TupleExample trunner = new TupleExample();
    trunner.example1();
}

void testArrayExample() {
    ArrayExample arunner = new ArrayExample();
    //arunner.example1();
    //arunner.example2();
    //arunner.example3();
    //arunner.example4();
    arunner.example5();
}

void testStringsExample() {
    StringsExample srunner = new StringsExample();
    srunner.example1();
}

void testCharactersExample() {
     CharactersExample crunner = new CharactersExample();
     crunner.example1();
     writeln();
     crunner.example2();
}

void testFunctionsExample() {
    FunctionsExample runner = new FunctionsExample();
    runner.example1();
    writeln();
    runner.example2();
    writeln();
    runner.example3();
    writeln();
    runner.example4();
    writeln();
    runner.example5();
    writeln();
    runner.example6();
}

void testDecisionMakingExample() {
   DecisionMakingExample runner = new DecisionMakingExample();
   runner.example1();
   writeln();
   runner.example2();
   writeln();
   runner.example3();
}

void testLoopExample() {
   LoopExample runner = new LoopExample();
   runner.example1();
   writeln();
   runner.example2();
   writeln();
   runner.example3();
   writeln();
   runner.example4();
   writeln();
   runner.example5();
   writeln();
}

void testOperatorsExample() {
   OperatorsExample runner = new OperatorsExample();
   runner.testMathOperators();
   // following does not work.
   //OperatorsExample.MathOperators mathOps = new OperatorsExample.MathOperators(20, 5);
   //mathOps.run();
   writeln();
   runner.testRationalOperators();
   writeln();
}

void testEnumExample() {
    EnumExample runner = new EnumExample();
    runner.example1();
    writeln();
    runner.example2();
    writeln();
    runner.example3();
    writeln();
    runner.example4();
}

void testComplexNumber() {
    ComplexNumber cn1 , cn2 ;
    cn1 = new ComplexNumber(3, 3);
    cn2 = new ComplexNumber(2, 2);
    ComplexNumber cnAdd = cn1 + cn2 ;
    ComplexNumber cnSub = cn1 - cn2 ;
    ComplexNumber cnMul = cn1 * cn2;
    ComplexNumber cnDiv = cn1 / cn2;
    writeln(format("cn1 = %s" , cn1.toString()));
    writeln(format("cn2 = %s", cn2.toString()));
    writeln(format("cn1 + cn2 = %s", cnAdd.toString()));
    writeln(format("cn1 - cn2 = %s" , cnSub.toString()));
    writeln(format("cn1 * cn2 = %s", cnMul.toString()));
    writeln(format("cn1 / cn2 = %s" , cnDiv.toString()));
}


void testInterfaceExample() {
    CustomFile cf1 , cf2, cf3, cf4;
    cf1 = new CustomFile("foo.read");
    cf2 = new CustomFile("foo.write");
    cf3 = new CustomFile("foo.exe");
    cf4 = new CustomFile("foo.read.write.exe");
    writeln(format("<<infos on %s>>", cf1.getFilename()));
    writeln(format("%s isReadable = %s", cf1.getFilename(), cf1.isReadable()));
    writeln(format("%s isWritable = %s", cf1.getFilename(), cf1.isWritable()));
    writeln(format("%s isExecutable = %s" , cf1.getFilename(), cf1.isExecutable()));
    cf1.read();
    cf1.write();
    cf1.execute();
    writeln();

    writeln(format("<<infos on %s>>", cf2.getFilename()));
    writeln(format("%s isReadable = %s", cf2.getFilename(), cf2.isReadable()));
    writeln(format("%s isWritable = %s", cf2.getFilename(), cf2.isWritable()));
    writeln(format("%s isExecutable = %s" , cf2.getFilename(), cf2.isExecutable()));
    cf2.read();
    cf2.write();
    cf2.execute();
    writeln();

    writeln(format("<<infos on %s>>", cf3.getFilename()));
    writeln(format("%s isReadable = %s", cf3.getFilename(), cf3.isReadable()));
    writeln(format("%s isWritable = %s", cf3.getFilename(), cf3.isWritable()));
    writeln(format("%s isExecutable = %s" , cf3.getFilename(), cf3.isExecutable()));
    cf3.read();
    cf3.write();
    cf3.execute();
    writeln();

    writeln(format("<<infos on %s>>", cf4.getFilename()));
    writeln(format("%s isReadable = %s", cf4.getFilename(), cf4.isReadable()));
    writeln(format("%s isWritable = %s", cf4.getFilename(), cf4.isWritable()));
    writeln(format("%s isExecutable = %s" , cf4.getFilename(), cf4.isExecutable()));
    cf4.read();
    cf4.write();
    cf4.execute();
    writeln();


    FinalAndStaticExampleImpl impl  = new FinalAndStaticExampleImpl();
    impl.finalMethod1();
    impl.staticMethod1();
}
void testMysqlExample() {
   MysqlExample runner = new MysqlExample();
   runner.example1();
}

void testDatabaseExample() {
    DatabaseExample runner = new DatabaseExample();
    runner.example1();
}

void testBox() {
    Box b1 , b2 ;
    b1 = new Box(3, 3, 3);
    b2 = new Box(2, 2, 2);
    Box bAdd = b1 + b2 ;
    Box bSub = b1 - b2 ;
    Box bMul = b1 * b2;
    Box bDiv = b1 / b2;
    Box bMod = b1 % b2 ;

    writeln(format("b1 = %s", b1.toString()));
    writeln(format("b2 = %s", b2.toString()));
    writeln(format("b1 + b2 = %s", bAdd.toString()));
    writeln(format("b1 - b2 = %s", bSub.toString()));
    writeln(format("b1 * b2 = %s", bMul.toString()));
    writeln(format("b1 / b2 = %s" , bDiv.toString()));
    writeln(format("b1 %% b2 = %s", bMod.toString()));

    bool bLt = b1 < b2 ;
    bool bLe = b1 <= b2 ;
    bool bGt = b1 > b2 ;
    bool bGe = b1 >= b2 ;
    bool bEq = b1 == b2 ;
    bool bNe = b1 != b2;
    writeln(format("b1 < b2 = %s", bLt));
    writeln(format("b1 <= b2 = %s", bLe));
    writeln(format("b1 > b2 = %s", bGt));
    writeln(format("b1 >= b2 = %s", bGe));
    writeln(format("b1 == b2 = %s", bEq));
    writeln(format("b1 != b2 = %s" , bNe));
}


void testPersonDAO() {
    Person p1, p2, p3;
    p1 = new Person(1, "foo", 10, 100.0, true);
    p2 = new Person(2, "bar", 20, 200.0, false);
    p3 = new Person(3, "bim", 30, 300.0, true);
    PersonDAOImpl dao = new PersonDAOImpl();
    dao.save(p1);
    dao.save(p2);
    dao.save(p3);
    Person[] all = dao.findAll();
    foreach(Person p; all) {
       writeln(p.toString());

    }

    dao.update(1L, new Person(1, "new foo", 66, 666.6, false));
    Person one = dao.findById(1L);
    writeln(format("after update = %s" , one.toString()));
    dao.remove(2L);
    all = dao.findAll();
    writeln("<<all people after remove(2L)>>");
    foreach(Person p; all) {
       writeln(p.toString());
    }
}