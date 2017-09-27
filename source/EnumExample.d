module EnumExample;

import std.stdio;

class EnumExample {
enum WeekDays {
  Sun , Mon, Tue, Wed, Thu, Fri, Sat
}

enum  {
  Sunday = 1 ,
  Monday ,
  Tuesday,
  Wednesday ,
  Thursday,
  Friday,
  Saturday
}


//this enum must be anonymous , otherwise enum value will not be printed.
enum : string  {
   A = "foo",
   B = "bar",
   C = "bim"
}


public:
   void example1() {
       WeekDays sun = WeekDays.Sun ;
       printWeekDay(sun);
       printWeekDay(WeekDays.Wed);
   }

   void example2() {
       int sun = Sunday ;
       printAnonymousWeekDay(sun);
       printAnonymousWeekDay(Thursday);
   }


   void example3() {
     //min , max , sizeof properties
     writefln("min WeekDay = %s", WeekDays.min);
     writefln("max WeekDay = %s", WeekDays.max);
     writefln("sizeof WeekDay = %d", WeekDays.sizeof);
   }


   void example4() {
      writefln("A = %s" , A);
      writefln("B = %s", B);
      writefln("C = %s" , C);
   }

   void printAnonymousWeekDay(int day) {
   switch(day) {
      case Sunday:
          writeln("Its Sunday.");
          break;
      case Monday:
          writeln("Its Monday.");
          break;
      case Tuesday:
          writeln("Its Tuesday.");
          break;
      case Wednesday:
          writeln("Its Wednesday.");
          break;
      case Thursday:
          writeln("Its Thursday.");
          break;
      case Friday:
          writeln("Its Friday.");
          break;
      case Saturday:
          writeln("Its Saturday.");
          break;
      default:
          writefln("Unknow enum instance to the system.");
          break;
      }
   }


   void printWeekDay(WeekDays day) {
      switch(day) {
      case WeekDays.Sun:
          writeln("Its Sunday.");
          break;
      case WeekDays.Mon:
          writeln("Its Monday.");
          break;
      case WeekDays.Tue:
          writeln("Its Tuesday.");
          break;
      case WeekDays.Wed:
          writeln("Its Wednesday.");
          break;
      case WeekDays.Thu:
          writeln("Its Thursday.");
          break;
      case WeekDays.Fri:
          writeln("Its Friday.");
          break;
      case WeekDays.Sat:
          writeln("Its Saturday.");
          break;
      default:
          writefln("Unknow enum instance to the system.");
          break;
      }
   }
}

