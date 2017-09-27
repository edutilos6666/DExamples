module CharactersExample;

import std.stdio;
import std.uni;
import std.format;
import std.conv ;

class CharactersExample {
public:

   //user input from std.stdio module
   void example2() {
      long id;
      string name;
      int age;
      double wage;
      bool active;
      writefln("insert your id: ");
      readf(" %d", &id);
      writefln("insert your name: ");
      readf(" %s", &name);
      writefln("insert your age: ");
      readf(" %d", &age);
      writefln("insert your wage: ");
      readf(" %f", &wage);
      writefln("insert whether you are active: ");
      readf(" %s", &active);

      writefln("<<Your inputs>>");
      writefln("id = %d" , id);
      writefln("name = %s", name);
      writefln("age = %d", age);
      writefln("wage = %.2f", wage);
      writefln("active = %s", active);
   }

   //some char functions from std.uni module
   void example1() {
      char letter = 'a';
      bool _isLower = isLower(letter);
      bool _isUpper = isUpper(letter);
      bool _isAlpha = isAlpha(letter);
      bool _isWhite = isWhite(letter);
      writefln("isLower = %s", _isLower);
      writefln("isUpper = %s", _isUpper);
      writefln("isAlpha = %s", _isAlpha);
      writefln("isWhite = %s", _isWhite);

      auto _toUpper = toUpper(letter);
      auto _toLower = toLower(_toUpper);
      writefln("_toUpper = %s" , _toUpper);
      writefln("_toLower = %s", _toLower);
   }
}

