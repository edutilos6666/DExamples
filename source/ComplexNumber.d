module ComplexNumber;

import std.stdio;
import std.string;
import std.conv;
import std.format;
import std.math;

class ComplexNumber {
private:
    double re;
    double im;

public:
    this(double re, double im) {
       this.re = re;
       this.im = im;
    }

    this() {

    }

    double getReal() {
       return re;
    }

    double getIm() {
      return im;
    }

    void setReal(double re) {
       this.re = re;
    }

    void setIm(double im) {
       this.im = im;
    }

    override string toString() {
       return format("%.2f + i*(%.2f)", re, im);
    }

    ComplexNumber opBinary(string op)(const ref ComplexNumber other) const {
       if(op == "+") return customAdd(other);
       else if(op == "-") return customSub(other);
       else if(op == "*") return customMul(other);
       else if(op == "/") return customDiv(other);
       else return new ComplexNumber();
    }

    ComplexNumber opBinary(string op)(double factor) const {
       ComplexNumber ret = new ComplexNumber();
       if(op == "*") {
          ret.re = this.re * factor;
          ret.im = this.im * factor;
       } else if(op == "/") {
          ret.re = this.re / factor;
          ret.im = this.im / factor;
       }

       return ret ;
    }

    ComplexNumber customAdd(const ref ComplexNumber other) const {
       ComplexNumber ret = new ComplexNumber();
       ret.re = this.re + other.re ;
       ret.im = this.im + other.im ;
       return ret;
    }

    ComplexNumber customSub(const ref ComplexNumber other) const {
       ComplexNumber ret = new ComplexNumber();
       ret.re = this.re - other.re;
       ret.im = this.im - other.im;
       return ret ;
    }

    ComplexNumber customMul(const ref ComplexNumber other) const {
       ComplexNumber ret = new ComplexNumber();
       ret.re = this.re*other.re - this.im*other.im;
       ret.im = this.re*other.im + this.im*other.re ;
       return ret;
    }


    ComplexNumber customDiv(const ref ComplexNumber other) const {
       ComplexNumber ret = new ComplexNumber();
       double factor = pow(other.re , 2) + pow(other.im , 2);
       ComplexNumber temp = new ComplexNumber(other.re, -other.im);
       ComplexNumber temp2 = new ComplexNumber(this.re, this.im);
       ret =  temp2*temp;
       ret = ret*factor;
       return ret ;
    }

}

