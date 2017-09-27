module DecisionMakingExample;

import std.stdio;
import std.format;
import std.conv ;

class DecisionMakingExample {
public:
   // if ... else if ... else ... example
   void example1() {
       string name = "foo";
       if(name == "foo") {
         writefln("name is foo");
       } else if(name == "bar") {
         writefln("name is bar");
       } else if(name == "bim") {
         writefln("name is bim");
       }


       int age = 15 ;
       if(age > 0 && age < 10) {
          writefln("You are a kid.");
       } else if(age >= 10 && age < 20) {
          writefln("You are a teenager.");
       } else if(age >= 20 && age < 40) {
          writefln("You are an adult.");
       } else if(age >= 40) {
          writefln("You are an elderly.");
       }
   }


   //switch
   void example2() {
      string name = "foo";
      switch(name) {
        case "edu":
           writefln("Your name is edu.");
           break;
        case "tilos":
           writefln("Your name is tilos.");
           break;
        case "foo":
           writefln("Your name is foo.");
           break;

        case "bar":
           writefln("Your name is bar.");
           break;
        default:
           writeln("Unknown name to the system.");
      }
   }

   // ?:
   void example3() {
       string name = "foo";
       int age = name == "foo"? 10 : 20;
       writefln("%s, your age is %d", name, age);
   }
}

