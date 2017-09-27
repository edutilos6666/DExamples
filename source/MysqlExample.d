module MysqlExample;

import std.stdio;
import std.format;
import std.conv;
import std.variant;
import mysql;

class MysqlExample {

    this() {
    }

    void example1() {
       // string connectionStr = "mysql://root:root@127.0.0.1:3306/test2?charset=utf-8";
        string connectionStr = "host=localhost;port=3306;user=root;pwd=root;db=test2";
        Connection conn = new Connection(connectionStr);
        writeln("connection success");
        //drop table
        string sql = """
        drop table if exists Worker
        """;
        exec(conn , sql);
        //create table
        sql = """create table if not exists Worker (
id bigint primary key,
name varchar(50) not null,
age int not null,
wage real not null,
active boolean not null
)""";
        exec(conn, sql);

        //insert
        Worker [3]workers;
        workers[0] = new Worker(1, "foo", 10, 100.0, true);
        workers[1] = new Worker(2, "bar", 20, 200.0, false);
        workers[2] = new Worker(3, "bim", 30, 300.0, true);
        sql = "insert into Worker VALUES(?, ?, ?,?, ?)";
        auto pstmt = prepare(conn , sql);
        foreach(w ; workers) {
             pstmt.setArgs(w.id, w.name, w.age, w.wage, w.active);
             pstmt.exec();
        }


        //select all
        writeln("<<all workers>>");
        sql = "select * from Worker" ;
        ResultRange rs = query(conn ,sql);

        foreach(row ; rs) {
              Variant id = row[0];
              Variant name = row[1];
              Variant age = row[2];
              Variant wage = row[3];
              Variant activeVar = row[4];
              byte temp = activeVar.get!(byte);
              bool active = (temp == 1)?true: false;
              writeln(new Worker(id.get!(long), name.get!(string),
               age.get!(int), wage.get!(double), active).toString());
        }

        //update
        sql = "update Worker set name = ?, age = ?, wage = ?, active = ? where id = ?";
        pstmt = prepare(conn , sql);
        pstmt.setArgs("new foo", 66, 666.666, false, 1);
        pstmt.exec();


        //select one
        writeln("<<after update>>");
        sql = "select * from Worker where id = ?" ;
        pstmt = prepare(conn, sql);
        pstmt.setArgs(1);
        rs = pstmt.query();
        Row one = rs.front;
            Variant id2 = one[0];
            Variant name2 = one[1];
            Variant age2 = one[2];
            Variant wage2 = one[3];
            Variant active2Var = one[4];
            byte temp2 = active2Var.get!(byte);
            bool active2 = (temp2 == 1)?true: false;
            writeln(new Worker(id2.get!(long), name2.get!(string),
              age2.get!(int), wage2.get!(double), active2).toString());


        //purge the rest results
        conn.purgeResult();


        //remove
        sql = "delete from Worker where id = ?" ;
        pstmt = prepare(conn, sql);
        pstmt.setArgs(1);
        pstmt.exec();

        //all
        sql = "select * from Worker" ;
        pstmt = prepare(conn, sql);
        rs = pstmt.query();
        writeln("<<all workers after remove by id 1>>");
        foreach(row ; rs) {
              Variant id = row[0];
              Variant name = row[1];
              Variant age = row[2];
              Variant wage = row[3];
              Variant activeVar = row[4];
              byte temp = activeVar.get!(byte);
              bool active = (temp == 1)?true: false;
              writeln(new Worker(id.get!(long), name.get!(string),
               age.get!(int), wage.get!(double), active).toString());
        }


        //close connection
        conn.close();
    }


class Worker {
private:
    long id;
    string name;
    int age;
    double wage;
    bool active;

public:
    this(long id, string name, int age, double wage, bool active)  {
       this.id = id;
       this.name = name;
       this.age = age;
       this.wage = wage;
       this.active = active;
    }


    override string toString() {
       return format("Worker(%d, %s, %d, %.2f, %s)", id, name, age, wage, active);
    }
}

}

