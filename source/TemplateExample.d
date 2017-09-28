module TemplateExample;

import std.stdio;
import std.format;

class TemplateExample {
public:
   void example1() {
       printProperties(1, "foo", 10, 100.0, true);
       writeln();
       printProperties(2L , "bar", 20L, 200.0, "false");
       writeln();
   }

   void example2() {
      TemplateWorker!(long, string , int, double , bool) w = new TemplateWorker!(long, string , int, double , bool)(1, "foo", 10, 100.0, true);
      writefln("w = %s", w.toString());
      writeln();

      alias WorkerType1 = TemplateWorker!(long, string , int , double , bool);
      alias WorkerType2 = TemplateWorker!(string , string , string , string , string);
      WorkerType1 w2 = new WorkerType1(2, "bar", 20, 200.0, false);
      WorkerType2 w3 = new WorkerType2("3", "bim", "30", "300.0", "true");
      writefln("w2 = %s", w2.toString());
      writefln("w3 = %s", w3.toString());
   }

   void printProperties(T1, T2, T3, T4, T5)(T1 id , T2 name, T3 age, T4 wage, T5 active)  {
         writefln("<<print Properties>>");
         writefln("id = %d", id);
         writefln("name = %s", name);
         writefln("age = %d", age);
         writefln("wage = %.2f" , wage);
         writefln("active = %s", active);
   }


   class TemplateWorker(T1, T2, T3, T4, T5) {
   private:
      T1 id;
      T2 name;
      T3 age;
      T4 wage;
      T5 active;

   public:
      this(T1 id, T2 name, T3 age, T4 wage, T5 active) {
         this.id = id ;
         this.name = name;
         this.age = age;
         this.wage = wage;
         this.active = active;
      }

      this() {

      }

      void setId(T1 id) {
         this.id = id ;
      }

      void setName(T2 name)  {
         this.name = name;
      }

      void setAge(T3 age) {
         this.age = age;
      }

      void setWage(T4 wage) {
         this.wage = wage;
      }

      void setActive(T5 active) {
         this.active = active;
      }

      T1 getId() {
         return this.id ;
      }

      T2 getName() {
         return this.name;
      }

      T3 getAge() {
         return this.age;
      }

      T4 getWage() {
         return this.wage;
      }

      T5 isActive() {
         return this.active;
      }

      override string toString() {
         return format("Worker(%s, %s, %s, %s, %s)",
           id, name, age, wage, active);
      }
   }
}

