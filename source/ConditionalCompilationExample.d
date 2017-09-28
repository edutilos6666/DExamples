module ConditionalCompilationExample;

import std.stdio;
import std.conv;
import std.format;

class ConditionalCompilationExample {
public:
   void example1() {
   // /usr/bin/dub run --build-mode separate --force  --debug=1 --> here debug 1
   // /usr/bin/dub run --build-mode separate --force  --debug=2  --> here debug 1, debug 2
     debug(1) writeln("debug 1");
     debug(2) writeln("debug 2");
   }


   void example2() {
       printTemplateType(new Worker());
       printTemplateType(WeekDays.Mon);
   }

  enum WeekDays {
    Sun , Mon , Tue, Wed, Thu, Fri, Sat
  }

  class Worker {

  }

   void printTemplateType(T)(T mytemplate) {
     static if (is (T == class)) {
         writefln("template type = class");
     } else static if (is (T == enum)) {
         writefln("template type = enum");
     }
   }
}

