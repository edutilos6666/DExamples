module MongoExample;

import std.stdio;
import mondo;
import bsond;
import std.format;
import std.conv;
import std.algorithm : all;

class MongoExample {
public:
  class Person {
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
      return format("Person(%d, %s, %d, %.2f, %s)",
              id, name, age, wage, active);
    }
  }

  Person convertRSToPerson(BO rs) {
      long id = rs["id"].as!long;  //convert BsonValue to long
      string name = rs["name"].as!string;
      int age = rs["age"].as!int;
      double wage = rs["wage"].as!double;
      bool active = rs["active"].as!bool;
      return new Person(id, name, age, wage, active);
  }
  void example2() {
     Mongo mongo = new Mongo("mongodb://localhost");
     Collection peopleCollection = mongo.db.people;
     if(peopleCollection.exists) peopleCollection.drop();
     //BO is alias for BsonObject
     Person []people = [
        new Person(1, "foo", 10, 100.0, true),
        new Person(2, "bar", 20, 200.0, false),
        new Person(3, "bim", 30, 300.0, false)
     ];
     foreach(person; people) {
         BO obj = BO(
             "id", person.id,
             "name", person.name,
             "age", person.age,
             "wage", person.wage,
             "active", person.active
         );
         peopleCollection.insert(obj);
     }


     auto all = peopleCollection.find();
     foreach(obj; all) {
        writeln(convertRSToPerson(obj));
     }


     //update
     //auto one = peopleCollection.findOne(BO("id", 1));
     Query query = new Query();
     query.conditions["id"] = 1;
     auto one = peopleCollection.find(query).front;
     //writefln("one = %s", one);
     one["name"] = "new foo";
     one["age"] = 66;
     one["wage"] = 666.6;
     one["active"] = false ;
     peopleCollection.save(one);

     one = peopleCollection.find(query).front;
     writefln("one after update = %s", convertRSToPerson(one).toString());


     //remove
     query = new Query();
     query.conditions["id"] = 2 ;
     query.conditions["name"] = "bar";
     query.conditions["age"] = 20;
     one = peopleCollection.find(query).front;
     peopleCollection.remove(one);
     all = peopleCollection.find();
     writefln("<<all after remove>>");
     foreach(obj ; all) {
       writeln(convertRSToPerson(obj));
     }
  }


  void example1() {
    // Create a connection to mongo
    Mongo mongo = new Mongo("mongodb://localhost");

    // Also: Collection c = mongo["my_database"]["my_collection"]
    Collection c = mongo.my_database.my_collection;

    // Drop collection if already exists
    if (c.exists) c.drop();

    // Insert a new object. BO is an alias for BsonObject
    // It inserts something like {"my_message" : "Ciao Mondo!", "my_language" : "it"}
    c.insert(BO(
      "my_message", "Ciao Mondo!",  // It actually means "Hello World!" in italian
      "my_language", "it"
    ));

    assert(c.count == 1); // Of course.

    auto obj = c.findOne(); // Returns the first object it finds

    // Verify it is the object we've just inserted
    assert( obj["my_message"].as!string == "Ciao Mondo!" );
    assert( obj["blah"].as!string("default") == "default"); // This field doesn't exists

    auto field = obj["my_message"].as!int(42);
    assert(field == 42);             // Conversion error. Defaulted
    assert(field.exists == true);    // Field exists on db
    assert(field.ok == false);       // But can't read as int

    obj["my_message"]    = "Hello World!";
    obj["my_language"]   = "en";

    // Save back object to db
    c.save(obj);

    // Do a simple check for all objects inside collection (just one)
    // c.find() returns a lazy range of BsonObject.
    import std.algorithm : all;
    assert(c.find.all!(x => x["my_language"].as!string == "en") == true);
  }
}

