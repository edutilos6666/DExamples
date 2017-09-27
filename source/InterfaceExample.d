module InterfaceExample;

import std.stdio;
import std.string;
import std.format;
import std.conv;


interface Readable {
public:
   bool isReadable() ;
   void read();
}

interface Writable {
public:
   bool isWritable();
   void write();
}


interface Executable {
public:
   bool isExecutable();
   void execute();
}


class CustomFile: Readable, Writable, Executable {
private:
   string filename;
public:
   this(string filename) {
       this.filename = filename;
   }

   bool isReadable()  {
       return filename.indexOf(".read") > 0 ;
   }
   void read() {
      if(isReadable()) {
         writeln(format("%s was read.", filename));
      } else {
         writeln(format("%s was not read", filename));
      }
   }
   bool isWritable() {
      return filename.indexOf(".write") > 0;
   }
   void write() {
      if(isWritable()) {
         writeln(format("%s was written.", filename));
      } else {
         writeln(format("%s was not writable.", filename));
      }
   }
   bool isExecutable() {
      return filename.indexOf(".exe") > 0;
   }
   void execute() {
       if(isExecutable()) {
           writeln(format("%s was executed.", filename));
       } else {
           writeln(format("%s was not executed.", filename));
       }
   }


   override string toString() {
       return format("CustomFile(%s)", filename);
   }

   string getFilename() {
      return filename;
   }
}



interface FinalAndStaticExample {
  final void finalMethod1()  {
     writeln("finalMethod1 was invoked.");
  }

  static void staticMethod1() {
    writeln("staticMethod1 was invoked.");
  }
}


class FinalAndStaticExampleImpl:FinalAndStaticExample {

}