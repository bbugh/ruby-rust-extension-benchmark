#[macro_use]
extern crate criterion;

use criterion::black_box;
use criterion::Criterion;

fn cash_flow(cash_in: f64, cash_out: f64, reinvest_rate: f64, term: i8, year: i8) -> f64 {
  let cash: f64 = cash_in - cash_out;
  let reinvestment = 1.0 + (reinvest_rate / 100.0);
  let power: i8 = term - year;

  cash * reinvestment.powi(power.into())
}

fn criterion_benchmark(c: &mut Criterion) {
  c.bench_function("cash_flow", |b| {
    b.iter(|| {
      cash_flow(
        black_box(14000.0),
        black_box(8000.0),
        black_box(8.0),
        black_box(8),
        black_box(4),
      )
    })
  });
}

criterion_group!(benches, criterion_benchmark);
criterion_main!(benches);
