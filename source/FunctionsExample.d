module FunctionsExample;

import std.stdio;
import core.vararg;
import std.conv;
import std.math;
import std.format;





class FunctionsExample {

    //property function
    class Rectangle {
    private:
       double width;
       double height;

    public:
       this() {

       }

       this(double width , double height) {
           this.width = width;
           this.height = height;
       }
       double area() const @property {
          return width* height;
       }

       void area(double newArea) @property {
           auto factor = sqrt(newArea / area);
           width *= factor;
           height *= factor;
       }

       override string toString() {
          return format("Rectangle(%.2f, %.2f)", width , height);
       }

    }

    void example6() {
        Rectangle rect = new Rectangle(10, 20);
        writefln("area = %.2f", rect.area);
        rect.area = 800;
        writefln("rect = %s", rect.toString());
    }

    //vararg function
    void example5() {
    double sum(double []arguments...) {
       double res = 0 ;
       for(int i=0; i< arguments.length; ++i) {
          res += arguments[i];

       }

       return res;
    }


    double avg(double []arguments...) {
       ulong size = arguments.length;
       double sum = 0;
       for(int i=0; i< size; ++i) {
          sum += arguments[i];
       }
       return sum / size;
    }

    double min(double []arguments...) {
       auto size = arguments.length;
       double res = arguments[0];
       for(auto i= 1; i < size; ++i) {
          if(res > arguments[i]) res = arguments[i];
       }

       return res ;
    }

    double max(double []arguments...) {
       auto size = arguments.length;
       double res = arguments[0];
       for(auto i = 1; i < size; ++i) {
          if(res < arguments[i]) res = arguments[i];
       }

       return res;
    }


    double resSum = sum(10, 20, 30, 40, 50);
    double resAvg = avg(10, 20, 30, 40, 50);
    double resMin = min(10, 20, 30, 40, 50);
    double resMax = max(10, 20, 30, 40, 50);
    writefln("<<vararg example>>");
    writefln("resSum = %.2f" , resSum);
    writefln("resAvg = %.2f" , resAvg);
    writefln("resMin = %.2f" , resMin);
    writefln("resMax = %.2f" , resMax);
    }



    //auto function
    void example4() {
       auto add(double n1, double n2) {
          return n1 + n2 ;
       }

       auto sub(double n1, double n2) {
          return n1 - n2;
       }

       auto mul(double n1, double n2) {
          return n1 * n2;
       }

       auto div(double n1, double n2) {
          return n1 / n2 ;
       }

       double n1 = 10 , n2 = 3 ;
       writefln("<<auto function example>>");
       double resAdd = add(n1, n2);
       double resSub = sub(n1, n2);
       double resMul = mul(n1, n2);
       double resDiv = div(n1, n2);
       writefln("n1 = %.2f , n2 = %.2f", n1, n2);
       writefln("n1 + n2 = %.2f" , resAdd);
       writefln("n1 - n2 = %.2f" , resSub);
       writefln("n1 * n2 = %.2f", resMul);
       writefln("n1 / n2 = %.2f", resDiv);
    }

    //ref function
    void example3() {
       double add(ref double n1, ref double n2) {
          return n1 + n2;
       }

       double sub(ref double n1, ref double n2) {
          return n1 - n2;
       }

       double mul(ref double n1, ref double n2) {
          return n1 * n2;
       }

       double div(ref double n1, ref double n2) {
          return n1 / n2;
       }

       double n1 = 10 , n2 = 3;
       writefln("<<ref function example>>");
       double resAdd = add(n1, n2);
       double resSub = sub(n1, n2);
       double resMul = mul(n1, n2);
       double resDiv = div(n1, n2);
       writefln("n1 + n2 = %.2f", resAdd);
       writefln("n1 - n2 = %.2f", resSub);
       writefln("n1 * n2 = %.2f" , resMul);
       writefln("n1 / n2 = %.2f", resDiv);
    }

    //nothrow function
    void example2() {
       double add(double n1, double n2) nothrow {
          return n1 + n2 ;
       }

       double sub(double n1, double n2) nothrow {
          return n1 - n2;
       }

       double mul(double n1, double n2) nothrow {
          return n1 * n2;
       }

       double div(double n1, double n2) nothrow {
          return n1 / n2 ;
       }

       writefln("<<nothrow function example>>");
       double n1 = 10, n2 = 3 ;
       double resAdd = add(n1, n2);
       double resSub = sub(n1, n2);
       double resMul = mul(n1, n2);
       double resDiv = div(n1, n2);
       writefln("n1 = %.2f, n2 = %.2f", n1, n2);
       writefln("n1 + n2 = %.2f" , resAdd);
       writefln("n1 - n2 = %.2f", resSub);
       writefln("n1 * n2 = %.2f", resMul);
       writefln("n1 / n2 = %.2f" , resDiv);
    }


    //pure function example
    void example1() {
      pure double  add(double n1, double n2) {
         return n1 + n2 ;
      }

      pure double sub(double n1, double n2) {
         return n1 - n2 ;
      }

      pure double mul(double n1, double n2) {
         return n1 * n2;
      }

      pure double div(double n1, double n2) {
         return n1 / n2 ;
      }

      double n1 = 10 , n2 = 3 ;
      double resAdd = add(n1, n2);
      double resSub = sub(n1, n2);
      double resMul = mul(n1, n2);
      double resDiv = div(n1, n2);
      writefln("<<Pure Function Example>>");
      writefln("n1 = %.2f, n2 = %.2f" , n1, n2);
      writefln("n1 + n2 = %.2f", resAdd);
      writefln("n1 - n2 = %.2f", resSub);
      writefln("n1 * n2 = %.2f", resMul);
      writefln("n1 / n2 = %.2f", resDiv);


    }


}

