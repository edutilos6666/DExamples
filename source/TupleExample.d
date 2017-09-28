module TupleExample;

import std.stdio;
import std.typecons;
import std.typetuple;

class TupleExample {
public:
   void example1() {
      auto props = tuple(1, "foo", 10, 100.0, true);
      writefln("props = %s", props);
      auto props2 = Tuple!(long , string , int, double , bool)(2, "bar", 20, 200.0, false);
      writefln("props2 = %s", props2);
      writefln("<<props>>");
      foreach(v ; props) {
         writefln("value = %s", v);
      }
      writeln();
      printProps(props.expand);


      //typetuple
      auto props3 = TypeTuple!(3, "bim", 30, 300.0, true);
      writefln("props3 = %s", props3);
      printProps(props3);
   }

   void printProps(long id, string name, int age, double wage, bool active) {
      writefln("<<printing properties>>");
      writefln("id = %d", id);
      writefln("name = %s", name);
      writefln("age = %d", age);
      writefln("wage = %.2f", wage);
      writefln("active = %s", active);
   }

      void printProps(int id, string name, int age, double wage, bool active) {
         writefln("<<printing properties>>");
         writefln("id = %d", id);
         writefln("name = %s", name);
         writefln("age = %d", age);
         writefln("wage = %.2f", wage);
         writefln("active = %s", active);
      }




}

