module StringsExample;

import std.stdio;
import std.format;
import std.conv;
import std.algorithm;
import std.uni;
import std.array;


class StringsExample {
public:
   void example1() {
       string str1 , str2 , str3;
       str1 = "foo";
       str2 = "bar";
       str3 = str1 ~ " " ~ str2 ;
       writefln("str1 = %s" , str1);
       writefln("str2 = %s", str2);
       writefln("str3 = %s" , str3);
       bool _startsWith = str3.startsWith("foo");
       bool _endsWith = str3.endsWith("bar");
       string strLower = str3.toLower();
       string strUpper = strLower.toUpper();
       writefln("startsWith = %s", _startsWith);
       writefln("endsWith = %s", _endsWith);
       writefln("strUpper = %s", strUpper);
       writefln("strLower = %s", strLower);

       auto splitted = str3.split(" ");
       writefln("<<splitted>>");
       foreach(x ; splitted) {
          writefln(x);
       }

       string  replaced = str3.replace("foo", "FOO");
       writefln("replaced = %s", replaced);

       string joined = join(["foo", "bar", "bim"], " ; ");
       writefln("joined = %s", joined);
       auto names = ["foo", "bar", "bim"];
       joined = join(names);
       writefln("joined = %s" , joined);

       auto cmpRes = cmp(str1, str2);
       writefln("cmp(str1, str2) = %s" , cmpRes);
       cmpRes = cmp(str2, str1);
       writefln("cmp(str2, str1) = %s", cmpRes);
       auto countRes = count("foobarbim", "oo");
       writefln("countRes = %d", countRes);

       writefln("str1 < str2 = %s" , (str1 < str2));
       writefln("str1 <= str2 = %s", (str1 <= str2));
       writefln("str1 > str2 = %s" , (str1 > str2));
       writefln("str1 >= str2 = %s", (str1 >= str2));
       writefln("str1 == str2 = %s", (str1 == str2));
       writefln("str1 != str2 = %s", (str1 != str2));
   }
}

