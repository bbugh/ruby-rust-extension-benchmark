#include "cash_flow_c.h"
#include<stdio.h>

VALUE rb_mCCalculations;

double exponent(double x, int power)
{
    int i; /* Variable used in loop counter */
    double number = 1;

    for (i = 0; i < power; ++i)
        number *= x;

    return(number);
}

static VALUE
cash_flow(VALUE obj, VALUE cash_in, VALUE cash_out, VALUE reinvest_rate, VALUE term, VALUE year) {
  double cash = NUM2DBL(cash_in) - NUM2DBL(cash_out);
  double investment = 1.0 + (NUM2DBL(reinvest_rate) / 100.0);
  int power = NUM2INT(term) - NUM2INT(year);

  return rb_float_new(cash * exponent(investment, power));
}

void
Init_cash_flow_c(void)
{
  rb_mCCalculations = rb_define_module("CCalculations");

  rb_define_module_function(rb_mCCalculations, "cash_flow", cash_flow, 5);
}
