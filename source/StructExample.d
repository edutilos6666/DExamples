module StructExample;

import std.stdio;

class StructExample {
public:
   struct Worker {
   private:
      long id;
      string name;
      int age;
      double wage;
      bool active;
   public:
      void setId(long id) {
         this.id = id ;
      }

      void setName(string name) {
         this.name = name;
      }

      void setAge(int age) {
         this.age = age;
      }

      void setWage(double wage) {
         this.wage = wage;
      }

      void setActive(bool active) {
         this.active = active;
      }

      long getId() {
         return this.id;
      }

      string getName() {
         return this.name;
      }

      int getAge() {
         return this.age ;
      }

      double getWage() {
         return this.wage;
      }

      bool isActive() {
         return this.active;
      }
   };


   void example1() {
      Worker w  = {id: 1 , name: "foo", age: 10, wage: 100.0, active:true};
      writefln("worker = %s" , w);
      w.setName("new_foo");
      w.setAge(66);
      writefln("worker = %s", w);
      writefln("worker name = %s", w.getName());
      writefln("worker age = %d", w.getAge());

      Worker w2 = Worker(2, "bar", 20, 200.0, false);
      writefln("w2 = %s" , w2);
   }

}

