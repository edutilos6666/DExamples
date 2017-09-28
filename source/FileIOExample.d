module FileIOExample;

import std.stdio;
import std.format;
import std.conv;
import std.string;


class FileIOExample {
public:
   void example1() {
     //write into file
     auto filename = "workers.txt";
     Worker [] workers = [
        new Worker(1, "foo", 10, 100.0, true),
        new Worker(2, "bar", 20, 200.0, false),
        new Worker(3, "bim", 30, 300.0, true)
       ];

     File f = File(filename, "w");
     foreach(w ; workers) {
        f.writeln(w.toString());
     }

     f.close();

     //read from file
     f = File(filename, "r");
     while(!f.eof()) {
       auto line = chomp(f.readln());
       auto props = line.split(", ");
       if(props.length != 5) continue;
       Worker w = convertLineToWorker(props);
       writefln("w = %s", w.toString());
     }

     f.close();
   }

   Worker convertLineToWorker(string[] props) {
       long id = to!long(props[0]);
       string name = props[1];
       int age = to!int(props[2]);
       double wage = to!double(props[3]);
       bool active = to!bool(props[4]);
       return new Worker(id, name, age, wage, active);
   }


   class Worker {
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

      override string toString() {
         return format("%d, %s, %d, %.2f, %s",
                id, name, age, wage, active);
      }
   }
}

