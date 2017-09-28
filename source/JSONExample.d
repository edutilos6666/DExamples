module JSONExample;

import std.stdio;
import std.format;
import std.conv;
import std.json;


class JSONExample {
public:
   void example1() {
      JSONValue jj = ["languages": "C++"];
      jj.object["id"] = 1;
      jj.object["name"] = "foo";
      jj.object["activities"] = ["reading", "writing", "speaking", "listening"];
      jj.object["languages2"] = ["C++"];
      jj["languages2"].array ~= [JSONValue("D"), JSONValue("C#"), JSONValue("Java")];
      writeln(jj.toString);
   }


   void example2() {
    string str = " {\"activities\":[\"reading\",\"writing\",\"speaking\",\"listening\"],\"id\":1,\"languages\":\"C++\",\"languages2\":[\"C++\",\"D\",\"C#\",\"Java\"],\"name\":\"foo\"} ";
    JSONValue jj = parseJSON(str);
    writeln(jj.toString);
    auto activities = jj["activities"].array;
    writefln("activities => %s",activities);
    writeln("<<Activities>>");
    foreach(activity; activities) {
       writef("%s ; ", activity);
    }

    writeln();
    string languages = jj["languages"].str;
    long id = jj["id"].integer;
    string name = jj["name"].str;
    JSONValue[] languages2 = jj["languages2"].array;
    writefln("languages = %s", languages);
    writefln("id = %d", id);
    writefln("name = %s", name);
    writefln("languages2 = %s", languages2);


   }
}

