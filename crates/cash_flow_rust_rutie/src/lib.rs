#[macro_use]
extern crate rutie;

fn cash_flow(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i32, year: i32) -> f64 {
  let cash: f64 = cash_in - cash_out;
  let reinvestment = 1.0 + (reinvest_rate / 100.0);
  let power: i32 = term - year;

  cash * reinvestment.powi(power.into())
}

use rutie::{Class, Float, Integer, Object};

class!(RutieExample);

methods!(
  RutieExample,
  _itself,
  fn pub_cash_flow(cash_in: Float, cash_out: Float, reinvest_rate: Float, term: Integer, year: Integer) -> Float {
    let result = cash_flow(
      cash_in.unwrap().to_f64(),
      cash_out.unwrap().to_f64(),
      reinvest_rate.unwrap().to_f64(),
      term.unwrap().to_i32(),
      year.unwrap().to_i32(),
    );
    Float::new(result)
  }
);

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn Init_cash_flow_rust_rutie() {
  Class::new("RustRutie", None).define(|itself| {
    itself.def_self("cash_flow", pub_cash_flow);
  });
}

#[cfg(test)]
mod tests {
  #[test]
  fn it_works() {
    assert_eq!(2 + 2, 4);
  }
}
