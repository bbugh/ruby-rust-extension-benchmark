use magnus::{define_module, function, prelude::*, Error};

fn cash_flow(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i32, year: i32) -> f64 {
    let cash: f64 = cash_in - cash_out;
    let reinvestment = 1.0 + (reinvest_rate / 100.0);
    let power: i32 = term - year;

    cash * reinvestment.powi(power.into())
}

#[magnus::init]
fn init() -> Result<(), Error> {
    let module = define_module("RustMagnus")?;
    module.define_singleton_method("cash_flow", function!(cash_flow, 5))?;
    Ok(())
}
