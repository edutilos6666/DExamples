module RangeExample;

import std.stdio;
import std.format;
import std.conv;
import std.range;
import std.algorithm;
import std.algorithm.mutation: copy ;

class RangeExample {
public:
    void testInputRange() {
         Student[] students = [
           Student(1,"foo", 10),
           Student(2, "bar", 20),
           Student(3, "bim", 30)
         ];

         StudentRange sr  = StudentRange(students);
         writefln("sr = %s" , sr);
         writefln("empty = %s ", sr.empty());
         writefln("front = %s", sr.front());
         sr.popFront;
         writefln("<<after popFront>>");
         writefln("sr = %s" , sr);
         writefln("empty = %s ", sr.empty());
         writefln("front = %s", sr.front());
    }


    void testForwardRange() {
         auto range = FibonacciSeries();
         report("Original range", range , 5);
         range.popFrontN(2);
         report("Original range after removing first 2", range, 5);
         auto theCopy = range.save();
         range.popFrontN(3);
         writefln("<<after removing first 3 elements from original range>>");
         report("Original range" , range, 5);
         report("theCopy" , theCopy, 5);
    }

    void testBidirectionalRange() {
        auto range1 = ReversedRange([10, 20, 30, 40, 50]);
        writefln("range1 = %s", range1);
        auto range2 = StraightRange([10.0, 20.0, 40.0, 30.0, 100.0]);
        writefln("range2 = %s", range2);
    }

    void testInfiniteRandomAccessRange() {
       auto range1 = new SquaresRange();
       writefln("range1[5]= %s", range1[5]);
       writefln("range1[10] = %s" , range1[10]);
       range1.popFrontN(5);
       writefln("range1[5]= %s", range1[5]);
       auto res = range1.take(5);
       writefln("res = %s", res);
       range1 = new SquaresRange();
       auto res2 = range1.take(100).filter!are_LastTwoDigitsSame;
       writefln("res2 = %s", res2);

       auto res3 = range1.take(10000).filter!(number => {
           if(number < 0) return false;
           auto last3digits = number % 1000;
           return (last3digits % 111) == 0;
       });

       writefln("res3 = %s", res3);
    }

    void testOutputRange() {
       MultiFile mf = new MultiFile("\n", "foo.txt", "bar.txt", "bim.txt");
       mf.write([1, 2,3]);
       mf.write(["edu", "tilos", "mesi"]);
       //this does not work.
       //copy(["edu", "tilos", "messi"], mf);
    }


 }





//output range
class MultiFile {
   string delimiter ;
   File [] files;
   this(string delimiter , string[] fileNames...) {
      this.delimiter = delimiter ;
       files ~= stdout ;
       foreach(fileName; fileNames) {
         File f = File(fileName, "w");
         files ~= f ;
       }
   }

   void write(T)(T element) {
     foreach(f; files) {
        f.write(element, delimiter);
     }
   }

}


    bool are_LastTwoDigitsSame(int number) {
       if(number < 0 ) return false;
       auto lastTwoDigits = number % 100;
       return (lastTwoDigits % 11) == 0;
    }

//infinite random access range
class SquaresRange {
   int first;
   enum empty = false;  // very important
   this(int first = 0) {
       this.first = first;
   }

   @property int front() const {
       return opIndex(0);
   }

   void popFront() {
       ++first;
   }

   @property SquaresRange save() const {
       return new SquaresRange(first);
   }

   int opIndex(size_t index) const {
      int value = first + cast(int)index;
      return value*value;
   }
}



//bidirectional range
struct StraightRange {
   double [] numbers ;
   this(double [] numbers) {
      this.numbers = numbers;
   }

   @property bool empty() const {
      return numbers.length == 0 ;
   }

   @property double front() const {
      return numbers.front;
   }

   @property double back() const {
      return numbers.back;
   }

   void popFront() {
      numbers.popFront();
   }

   void popBack() {
      numbers.popBack();
   }
}

//bidirectional range
struct ReversedRange {
    int [] numbers ;
    this(int [] numbers)  {
       this.numbers = numbers;
    }

    @property bool empty() const {
       return this.numbers.length == 0 ;
    }

    @property int front() const {
       return numbers.back ;
    }

    @property int back() const {
       return numbers.front;
    }

    void popFront() {
        numbers.popBack();
    }

    void popBack() {
        numbers.popFront();
    }
}

struct FibonacciSeries {
   int first = 0 ;
   int second = 1 ;
   bool empty = false;
   @property int front() const {
     return first ;
   }

   void popFront() {
      int third = first + second ;
      first = second ;
      second = third ;
   }

   @property FibonacciSeries save() const {
      return this;
   }
}

void report(T)(const string title , const ref T range, int times) {
    writefln("%s => %s" , title, take(range, times));
}


struct Student {
   long id;
   string name;
   int age;

   string toString() {
     return format("Student(%d, %s, %d)", id, name, age);
   }
}


struct StudentRange {
   Student[] students ;
   this(Student[] students) {
       this.students = students;
   }

   @property bool empty() const {
       return students.length == 0;
   }

   @property ref Student front() {
       return students[0];
   }

   void popFront() {
      students = students[1 .. $];
   }
}





