module LoopExample;

import std.stdio;
import std.format;

class LoopExample {
public:
   //while example
   void example1() {
       int n = 0;
       while(n < 10) {
          writefln("number = %d", n);
          n++;
       }
   }

   //for example
   void example2() {
      for(int n = 10; n < 20; ++n) {
          writefln("number = %d", n);
      }
   }


   //do ... while example
   void example3() {
      int n = 0 ;
      do {
         writefln("number = %d", n);
         ++n;
      } while(n < 10);
   }


   //nested for example
   void example4() {
      int  [5][3] numbers;
      numbers[0] = [1, 2, 3, 4, 5];
      numbers[1] = [2, 3, 4, 5, 6];
      numbers[2] = [3, 4, 5, 6, 7];
      for(int i=0; i< 3; ++i) {
        for(int j=0; j< 5; ++j) {
           writef("%d; ", numbers[i][j]);
        }
        writeln();
      }
   }

   //break and continue keywords
   void example5() {
      int [] numbers  = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      for(int i = 0 ; i< 10; ++i) {
          //i++;
          if(i == 5) continue;
          if(i == 8) break;
          writefln("number[%d] = %d", i, numbers[i]);
      }
   }

}

