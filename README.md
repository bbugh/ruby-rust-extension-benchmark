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
             c class    256870 i/100ms
         ruby method    242356 i/100ms
    rust rutie class    222419 i/100ms
     rust ruru class    219317 i/100ms
      rust ffi class    185809 i/100ms
 rust helix instance    134728 i/100ms
    rust helix class    128296 i/100ms
Calculating -------------------------------------
                      iterations per second   total iters      elapsed
             c class  6372371.1 (±1.8%) i/s -   32108750     in 5.040398s
         ruby method  5539582.3 (±4.3%) i/s -   27870940     in 5.041241s
    rust rutie class  4657473.6 (±3.7%) i/s -   23353995     in 5.022412s
     rust ruru class  4598947.6 (±2.9%) i/s -   23028285     in 5.012100s
      rust ffi class  3402816.9 (±2.0%) i/s -   17094428     in 5.025874s
 rust helix instance  1956356.3 (±2.5%) i/s -    9835144     in 5.030403s
    rust helix class  1898906.4 (±1.8%) i/s -    9493904     in 5.001337s

Comparison:
             c class:  6372371.1 i/s
         ruby method:  5539582.3 i/s - 1.15x  slower
    rust rutie class:  4657473.6 i/s - 1.37x  slower
     rust ruru class:  4598947.6 i/s - 1.39x  slower
      rust ffi class:  3402816.9 i/s - 1.87x  slower
 rust helix instance:  1956356.3 i/s - 3.26x  slower
    rust helix class:  1898906.4 i/s - 3.36x  slower
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
