module ArrayExample;

import std.stdio;
import std.format;
import std.conv;
import std.random;
import std.algorithm.sorting;
import std.algorithm.mutation;

class ArrayExample {
public:
   void example1() {
       auto rnd = Random(1000);
       int [10] numbers;
       for(int i=0; i< numbers.length ; ++i) {
           numbers[i] = uniform(0, 100, rnd);
       }
       auto _length = numbers.length;
       auto _sizeof = numbers.sizeof;
       auto _dup = numbers.dup;
       auto _idup = numbers.idup;
       auto _ptr = numbers.ptr;
       //auto _reverse = numbers.reverse();
       // auto _sort = sort(numbers);
       writefln("numbers = %s", numbers);
       writefln("length = %d", _length);
       writefln("sizeof = %d", _sizeof);
       writefln("dup = %s", _dup);
       writefln("idup = %s", _idup);
       writefln("ptr = %s", _ptr);
   }

  int randomInt() {
       auto rnd = Random(1000);
       return uniform(0 , 100, rnd);
   }

   void example2() {

       //int [] numbers = [randomInt(), randomInt(), randomInt(),
       //  randomInt(), randomInt(), randomInt()];

       int [] numbers = [7, 79, 47, 48, 51, 74, 16, 57, 97, 4];

       auto sorted = sort(numbers.dup);
       auto _dup = numbers.dup;
       reverse(_dup);

       writefln("numbers = %s", numbers);
       writefln("sorted = %s", sorted);
       writefln("reversed = %s", _dup);
   }



   //multi-dimensional array
   void example3() {
       int [][] numbers = [
         [1, 2, 3,4, 5],
         [6, 7,8, 9, 10],
         [11, 12, 13, 14, 15]
       ];

       writefln("<<numbers>>");
       for(int i=0 ; i< 3; ++i) {
          for(int j=0; j< 5 ; ++j) {
             writef("%s ; ", numbers[i][j]);
          }
          writeln();
       }


       int [5][3] numbers2;
       numbers2[0] = [1, 2, 3, 4, 5];
       numbers2[1] = [6, 7, 8, 9, 10];
       numbers2[2] = [11, 12, 13, 14, 15];
       writefln("<<numbers2>>");
       for(int i=0; i< 3; ++i) {
         for(int j=0; j< 5; ++j) {
            writef("%s ; ", numbers2[i][j]);
         }
         writeln();
       }
   }



   //common array operations
   void example4() {
       string [3] names ;
       names[0] = "foo";
       names[1] = "bar";
       names[2] = "bim";
       writefln("names = %s", names);
       names[0..3] = "new foo";
       writefln("names = %s", names);

       string [] names1 = ["edu" , "tilos"];
       string [] names2 = ["foo", "bar"];
       string [] names3 = ["pako", "deko"];
       string [] combined = names1 ~ names2 ~ names3;
       writefln("combined = %s", combined);

       //iterate over combined
       foreach(string name; combined) {
          writef("%s ; ", name);
       }

       writeln();
   }


   // associative array
   void example5() {
        int[string] props;
        props["foo"] = 10 ;
        props["bar"] = 20 ;
        props["bim"] = 30 ;

        writefln("props = %s", props);


        int[string] props2 = [
            "foo": 10 ,
            "bar": 20 ,
            "bim": 30
        ];


        writefln("props2 = %s", props2);


        auto _length = props.length ;
        auto _sizeof = props.sizeof;
        auto _dup = props.dup;
        auto _keys = props.keys;
        auto _values = props.values ;
        auto _rehash = props.rehash;
        auto _value_foo = props.get("foo", 0);
        writefln("length = %d" , _length);
        writefln("sizeof = %d", _sizeof);
        writefln("dup = %s", _dup);
        writefln("keys = %s", _keys);
        writefln("values = %s", _values);
        writefln("rehash = %s" , _rehash);
        writefln("value_foo = %s" , _value_foo);


        foreach(k, v ; props) {
            writefln("%s => %d" , k , v);
        }

        writeln();
        foreach(k ; props.keys)  {
           writefln("%s => %d" , k , props[k]);
        }

        writeln();
        foreach(k ;  props.byKey) {
           writefln("%s => %d" , k, props[k]);
        }
        writeln();
        foreach(v; props.byValue) {
          writef("%d ; " , v);
        }
        writeln();
        foreach(p; props.byKeyValue) {
           writefln("%s => %d" , p.key, p.value);
        }
        writeln();

   }


}

