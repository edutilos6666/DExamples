//module Person;

import std.stdio;
import std.format;

class Person {
private:
   long id;
   string name;
   int age;
   double wage;
   bool active;

public:
   this() {

   }

   this(long id, string name, int age, double wage, bool active) {
       this.id = id;
       this.name = name;
       this.age = age;
       this.wage = wage;
       this.active = active;
   }

   //setters
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

   override string toString() {
       return format("[%d, %s, %d, %.2f, %s]", this.id ,
               this.name, this.age, this.wage, this.active);
   }
}


interface PersonDAO {
public:
   void save(Person p);
   void update(long id, Person newP);
   void remove(long id);
   Person findById(long id);
   Person[] findAll();
}


class PersonDAOImpl: PersonDAO {
private:
   Person[long] container;
public:
   void save(Person p) {
      container[p.getId()] = p;
   }
   void update(long id, Person newP) {
      container.remove(id);
      container[id] = newP;
   }
   void remove(long id) {
      container.remove(id);
   }
   Person findById(long id) {
      return container[id];
   }
   Person[] findAll() {
      return container.values;
   }
}