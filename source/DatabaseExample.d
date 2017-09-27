module DatabaseExample;

import std.stdio;
import std.conv;
import database;
import std.format;

class DatabaseExample {

    this() {
    }

    void example1() {
       auto db = new Database("mysql://root:root@127.0.0.1:3306/test2?charset=utf-8");
       writeln("connection success");

       db.close();

    }

}

