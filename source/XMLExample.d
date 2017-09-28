module XMLExample;

import std.stdio;
import std.format;
import std.conv;
import std.xml;
import std.string;

class XMLExample {
public:

   // parse xml
   void example2() {
      string s = cast(string) std.file.read("Workers.xml");
      Worker [] workers;

      auto xml = new DocumentParser(s);
      xml.onStartTag["Worker"] = (ElementParser xml) {
         Worker w = new Worker();
         w.id = to!long(xml.tag.attr["id"]);
         xml.onEndTag["Name"] = (in Element el) { w.name = el.text(); };
         xml.onEndTag["Age"] = (in Element el) {w.age = to!int(el.text()); };
         xml.onEndTag["Wage"] = (in Element el) {w.wage = to!double(el.text()); };
         xml.onEndTag["Active"] = (in Element el) {w.active = to!bool(el.text()); };
         xml.parse();

         workers ~= w ;
      };

      xml.parse();

      writefln("<<all workers>>");
      foreach(w ; workers) {
        writeln(w.toString());
      }
   }


   void example1() {
      //create xml
      auto doc = new Document(new Tag("Workers"));

      Worker [] workers = [
        new Worker(1, "foo", 10, 100.0, true),
        new Worker(2, "bar", 20, 200.0, false),
        new Worker(3, "bim", 30, 300.0, true),
        new Worker(4, "pako", 40, 400.0, false)
      ];

      foreach(w; workers) {
        Element el = new Element("Worker");
        el.tag.attr["id"] = to!string(w.id);

        el ~= new Element("Name", w.name);
        el ~= new Element("Age", to!string(w.age));
        el ~= new Element("Wage", to!string(w.wage));
        el ~= new Element("Active", to!string(w.active));

        doc ~= el;
      }

      auto xmlString = join(doc.pretty(3), "\n");
      writefln(xmlString);
      string filename = "Workers.xml";
      File f = File(filename, "w");
      f.writeln(xmlString);
      f.close();
   }



   class Worker {
   public:
     long id;
     string name;
     int age;
     double wage;
     bool active;

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
        return format("Worker(%d, %s, %d, %.2f, %s)",
              id, name, age, wage, active);
     }
   }
}

