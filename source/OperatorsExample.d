module OperatorsExample;

import std.stdio;

class OperatorsExample {
public:


   class MathOperators {
      private:
         double n1;
         double n2;

      public:
         this(double n1, double n2) {
            this.n1 = n1 ;
            this.n2 = n2;
         }

         void run() {
            double resAdd = n1 + n2 ;
            double resSub = n1 - n2 ;
            double resMul = n1 * n2 ;
            double resDiv = n1 / n2 ;
            double resMod = n1 % n2 ;
            double resInc = n1++;
            double resDec = n1--;
            double resInc2 = ++n1;
            double resDec2 = --n1;
            writefln("n1 = %.2f, n2 = %.2f", n1, n2);
            writefln("n1 + n2 = %.2f" , resAdd);
            writefln("n1 - n2 = %.2f", resSub);
            writefln("n1 * n2 = %.2f", resMul);
            writefln("n1 / n2 = %.2f", resMod);
            writefln("n1++ = %.2f" , resInc);
            writefln("n1-- = %.2f", resDec);
            writefln("++n1 = %.2f", resInc2);
            writefln("--n1 = %.2f", resDec2);
         }

   }

   class RationalOperators {
      private:
         double n1;
         double n2;
      public:
         this(double n1, double n2) {
            this.n1 = n1;
            this.n2 = n2;
         }

         void run() {
            bool eq = (n1 == n2);
            bool ne = (n1 != n2);
            bool gt = (n1 > n2);
            bool ge = (n1 >= n2);
            bool lt = (n1 < n2);
            bool le = (n1 <= n2);
            writefln("n1 = %.2f, n2 = %.2f", n1, n2);
            writefln("n1 == n2 = %s" , eq);
            writefln("n1 != n2 = %s", ne);
            writefln("n1 < n2 = %s", lt);
            writefln("n1 <= n2 = %s", le);
            writefln("n1 > n2 = %s", gt);
            writefln("n1 >= n2 = %s", ge);
         }
   }

   void testMathOperators() {
       double n1 = 10 , n2 = 3;
       MathOperators runner = new MathOperators(n1, n2);
       runner.run();
   }


   void testRationalOperators()  {
       double n1 = 10, n2 = 3;
       RationalOperators runner = new RationalOperators(n1, n2);
       runner.run();
   }

}

