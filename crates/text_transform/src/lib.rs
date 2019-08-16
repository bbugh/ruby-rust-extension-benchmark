#[macro_use]
extern crate helix;

ruby! {
    class TextTransform {
        def hello() {
            println!("Hello from text_transform!");
        }

        def cash_flow(&self, cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i32, year: i32) -> f64 {
            cash_flow(cash_in, cash_out, reinvest_rate, term, year)
        }

        def cash_flow_class(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i32, year: i32) -> f64 {
            cash_flow(cash_in, cash_out, reinvest_rate, term, year)
        }
    }
}

// fn cash_flow(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: u32, year: u32) -> f64 {
//   let cash: f64 = (cash_in - cash_out);
//   let reinvestment = (1.0 + (reinvest_rate / 100.0));
//   let power: u32 = term - year;

//   cash * reinvestment.checked_pow(power);
// }

fn cash_flow(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i32, year: i32) -> f64 {
  let cash: f64 = cash_in - cash_out;
  let reinvestment = 1.0 + (reinvest_rate / 100.0);
  let power: i32 = term - year;

  cash * reinvestment.powi(power.into())
}

#[test]
fn test_cash_flow() {
  assert_eq!(cash_flow(14000.0, 8000.0, 8.0, 8, 4), 8162.933760000002)
}
