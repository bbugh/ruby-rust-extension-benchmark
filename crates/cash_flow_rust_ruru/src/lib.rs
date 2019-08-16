// Code adapted from https://github.com/squiidz/pair

#[macro_use]
extern crate ruru;

use std::convert::TryFrom; // convert from i64 to i32

use ruru::{AnyObject, Class, Fixnum, Float, Object};

methods!(
  AnyObject,
  _itself,
  // Note: this is very unsafe for some reason, if an exact float isn't passed
  // in for the Floats (100.0 vs 100), Rust will panic.
  fn cash_flow(cash_in: Float, cash_out: Float, reinvest_rate: Float, term: Fixnum, year: Fixnum) -> Float {
    let cash: f64 = cash_in.unwrap().to_f64() - cash_out.unwrap().to_f64();
    let reinvestment = 1.0 + (reinvest_rate.unwrap().to_f64() / 100.0);
    let power: i32 = i32::try_from(term.unwrap().to_i64() - year.unwrap().to_i64()).unwrap_or(1);

    Float::new(cash * reinvestment.powi(power.into()) as f64)
  }
);

#[no_mangle]
pub extern "C" fn initialize() {
  Class::new("RustRuru", None).define_singleton_method("cash_flow", cash_flow);
}
