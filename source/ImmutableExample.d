module ImmutableExample;

import std.stdio;

class ImmutableExample {
   //immutable keyword
   void example1() {
      immutable id = 1L ;
      immutable name = "foo";
      immutable age = 10;
      immutable wage = 100.0;
      immutable active = true;
      writefln("<<Immutable Values>>");
      writefln("id = %d", id);
      writefln("name = %s", name);
      writefln("age = %d", age);
      writefln("wage = %.2f", wage);
      writefln("active = %s", active);
      writefln("typeof id = %s", typeof(id).stringof);
      writefln("typeof name = %s", typeof(name).stringof);
      writefln("typeof age = %s", typeof(age).stringof);
      writefln("typeof wage = %s", typeof(wage).stringof);
      writefln("typeof active = %s", typeof(active).stringof);
   }


   //const keyword
   void example2() {
      const id = 1L ;
      const name = "foo";
      const age = 10;
      const wage = 100.0;
      const active = true;
      writefln("<<Immutable Values>>");
      writefln("id = %d", id);
      writefln("name = %s", name);
      writefln("age = %d", age);
      writefln("wage = %.2f", wage);
      writefln("active = %s", active);
      writefln("typeof id = %s", typeof(id).stringof);
      writefln("typeof name = %s", typeof(name).stringof);
      writefln("typeof age = %s", typeof(age).stringof);
      writefln("typeof wage = %s", typeof(wage).stringof);
      writefln("typeof active = %s", typeof(active).stringof);
   }


   //immutable array
   void example3() {
     immutable int [] numbers = [10, 20, 30, 40, 50];
     foreach(i, el; numbers) {
        writefln("%d => %d", i , el);
     }
   }
}

