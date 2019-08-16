#[no_mangle]
pub extern fn cash_flow_class(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i32, year: i32) -> f64 {
  let cash: f64 = cash_in - cash_out;
  let reinvestment = 1.0 + (reinvest_rate / 100.0);
  let power: i32 = term - year;

  cash * reinvestment.powi(power.into())
}

// #[no_mangle]
// pub extern fn double_input(input: i32) -> i32 {
//     input * 2
// }
