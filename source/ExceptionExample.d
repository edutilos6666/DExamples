module ExceptionExample;

import std.stdio;
import std.format;
import std.conv;


class ExceptionExample {
public:
   void example1() {
     try {
        auto res = safeDivision(10, 3);
        writefln("res = %.2f" , res);
        res = safeDivision(10, 0);
        writefln("res = %.2f" , res);
     } catch(Exception ex) {
        writefln("ex = %s" , ex.msg);
     } finally {
        writefln("finally block");
     }
   }

   double safeDivision(int x, int y) {
     if(x == 0) {
        throw new Exception("Division by Zero");
     } else {
        return to!double(x / y);
     }


   }
}

