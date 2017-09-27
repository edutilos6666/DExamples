import std.stdio;
import Person;
import std.format;
import Box ;
import DatabaseExample;
import MysqlExample;

//import database;

void testPersonDAO();
void testBox();
void testDatabaseExample();
void testMysqlExample();

void main()
{
	testMysqlExample();
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