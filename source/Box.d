module Box;

import std.stdio;
import std.format;
import std.conv;

class Box {
private:
    double width;
    double height;
    double depth;

public:
    this() {
    }
    this(double width , double height, double depth) {
       this.width = width;
       this.height = height;
       this.depth = depth ;
    }

    ~this() {
    }

/*    override size_t toHash() {
        // todo
    }

    override string toString() {
        // todo: make a useful toString()
    }*/


    double getWidth()  {
        return this.width ;
    }

    double getHeight() {
        return this.height;
    }

    double getDepth() {
        return this.depth;
    }

    void setWidth(double width) {
        this.width = width ;
    }

    void setHeigth(double height) {
        this.height = height;
    }

    void setDepth(double depth) {
        this.depth = depth ;
    }

    double volume() {
        return this.width * this.height * this.depth ;
    }

    override string toString() {
        return format("Box(%.2f, %.2f, %.2f)", width , height, depth);
    }


    Box opBinary(string op)(Box other) {
        Box ret = new Box() ;
        if(op == "+") {
            ret.width = this.width + other.width;
            ret.height = this.height + other.height;
            ret.depth = this.depth + other.depth ;
        } else if(op == "-") {
            ret.width = this.width - other.width;
            ret.height = this.height - other.height;
            ret.depth = this.depth - other.depth ;
        }  else if(op == "*") {
            ret.width = this.width * other.width;
            ret.height = this.height * other.height;
            ret.depth = this.depth * other.depth;
        }  else if(op == "/") {
            ret.width = this.width / other.width;
            ret.height = this.height / other.height;
            ret.depth = this.depth / other.depth;
        }  else if (op == "%") {
            ret.width = this.width % other.width;
            ret.height = this.height % other.height;
            ret.depth = this.depth % other.depth ;
        }
        return ret;
    }


    override int opCmp(Object other) {
        return to!int(this.volume() - to!Box(other).volume());
    }

    override bool opEquals(Object other) {
        return this.volume() == to!Box(other).volume();
    }


}

