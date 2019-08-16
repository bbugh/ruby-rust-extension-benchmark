#include "example_ext.h"
#include<stdio.h>

VALUE rb_mExampleExt;

static VALUE
example_hello(int argc, VALUE *argv)
{
  printf("hello\n");

  return Qnil;
}

// fn cash_flow(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i32, year: i32) -> f64 {
//   let cash: f64 = cash_in - cash_out;
//   let reinvestment = 1.0 + (reinvest_rate / 100.0);
//   let power: i32 = term - year;

//   cash * reinvestment.powi(power.into())
// }

int exponentiation(double base, int exp) {
    int i, result = 1;
    for (i = 0; i < exp; i++)
        result *= base;
    return result;
 }

 double exponent(double x, int power)
{
    int i; /* Variable used in loop counter */
    double number = 1;

    for (i = 0; i < power; ++i)
        number *= x;

    return(number);
}

// def cash_flow(cash_in, cash_out, reinvest_rate, term, year)
//   cash = cash_in - cash_out
//   investment = 1.0 + (reinvest_rate / 100.0)
//   power = term - year
//   puts "cash #{cash}", "investment #{investment}", "power #{power}", "exp #{(investment ** power)}"
//   cash * (investment ** power)
// end
// cash_flow(1000, 800, 50, 30, 5)
// cash_flow(100, 80, 5, 30, 1)

static VALUE
cash_flow(VALUE obj, VALUE cash_in, VALUE cash_out, VALUE reinvest_rate, VALUE term, VALUE year) {
  // double whatever = NUM2DBL(cash_in);
  double cash = NUM2DBL(cash_in) - NUM2DBL(cash_out);
  double investment = 1.0 + (NUM2DBL(reinvest_rate) / 100.0);
  int power = NUM2INT(term) - NUM2INT(year);

  // printf("cash %f\n",cash);
  // printf("investment %f\n",investment);
  // printf("power %d\n",power);

  // double exp = exponent(investment, power);
  // double result = cash * exponent(investment, power);

  // printf("exp %f\n", exp);
  // printf("result %f\n", result);

  // // return rb_float_new(5050233.65880847);

  return rb_float_new(cash * exponent(investment, power));
}

static VALUE sum(obj,arg1,arg2) //VALUE obj,arg1;
{
    double val1 = NUM2DBL(arg1);
    double val2 = NUM2DBL(arg2);
    return rb_float_new(val1+val2);
}

void
Init_example_ext(void)
{
  rb_mExampleExt = rb_define_module("ExampleExt");

  rb_define_module_function(rb_mExampleExt, "hello", example_hello, -1);
  rb_define_module_function(rb_mExampleExt, "cash_flow", cash_flow, 5);
  rb_define_module_function(rb_mExampleExt, "sum", sum, 2);
}
