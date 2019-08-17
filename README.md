# Benchmark Rust/C Extensions for Ruby

This implements a simple math function (`cash_flow`) in seven different
ways, and uses `benchmark-ips` to measure the benchmark of each method:

- Ruby method
- C extension
- Rust via [FFI](https://github.com/ffi/ffi)
- Rust via [Helix](https://github.com/tildeio/helix) (class method and instance method)
- Rust via [Ruru](https://github.com/d-unseductable/ruru)
- Rust via [Rutie](https://github.com/danielpclark/rutie)

See [`benchmark.rb`](benchmark.rb) for the implementations.

## Goals

> ***This is not intended to be a generalized statement about the performance of
> each of these libraries. The simple function used for benchmarking is not an
> optimal use case for native code, Ruby is plenty fast for simple math.***

- Verify if offloading ***basic*** math operations to Rust/C would have
  performance benefits (answer: Rust - no, C - maybe)
- Verify if using Rust for Ruby interop had Good Enough® performance (answer: maybe)
- Compare each of the different integration options to see which has the best
  tradeoff between developer productivity and performance. Opinions:
    - The C API is well documented (via docs or source code) and easy to pick
      up, but it's C so it's hard to program safely.
    - Rust/Helix has the simplest API but the worst performance for this
      benchmark by about half.
    - Rust/Ruru is almost as fast as C but has a pretty unfriendly and incomplete
      API (and the project appears to be dead).
    - Rust/Rutie is a fork of ruru, with a lot of fixes and improvements. The
      project is also still active.
    - FFI generally speaking is fast for simple things, but really challenging
      for any level of complexity (and strings).

If I were to pick from the list for a project, I would most likely choose Rutie,
as it is the only library still in active development (as of August 2019) and
has the best tradeoff of API vs performance.

## Results



Ordered by fastest to slowest by iterations per second, descending.

```
Warming up --------------------------------------
             c class    223175 i/100ms
         ruby method    211673 i/100ms
     rust ruru class    198891 i/100ms
    rust rutie class    191695 i/100ms
      rust ffi class    163458 i/100ms
 rust helix instance    120611 i/100ms
    rust helix class    114611 i/100ms
Calculating -------------------------------------
                      iterations per second   total iterations      elapsed
             c class  5483016.5 (±6.0%) i/s -   27491172          in 5.032074s
         ruby method  4966573.4 (±6.8%) i/s -   24824438          in 5.022462s
     rust ruru class  4275527.6 (±6.2%) i/s -   21383522          in 5.021156s
    rust rutie class  4051435.0 (±6.7%) i/s -   20319670          in 5.039406s
      rust ffi class  3082134.8 (±8.1%) i/s -   15348010          in 5.019943s
 rust helix instance  1875397.8 (±6.1%) i/s -    9429030          in 5.046921s
    rust helix class  1852779.7 (±5.9%) i/s -    9246236          in 5.008588s
```

## Running the Benchmark Yourself

1. Clone the repo
2. Run `bundle install`
2. Run `build-libs.sh`
3. Run `ruby benchmark.rb`

## Credits

I didn't write most of the sub projects from scratch, they were based on starter templates
from various heroes of the Internet.

- Rust FFI was adapted from https://github.com/alexcrichton/rust-ffi-examples
- Rust Helix was adapted from the Getting Started guide
- Rust Ruru was adapted from https://github.com/squiidz/pair
- C extension was adapted from https://github.com/wataash/ruby-example-c-ext
- Rust Rutie is easy to use, so it's ALL MINE BAHAHA.

Thanks to them for providing the easy springboard.

## License

This benchmark repository is available as open source under the terms of the MIT
License, or under the license of the individual project subdirectories as
defiend in their license files, whichever is the most restrictive and doesn't
get me in legal trouble.
