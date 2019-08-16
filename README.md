# Benchmark Rust/C Extensions for Ruby

This implements a native code basic math function (`cash_flow`) in six different
ways, and uses `benchmark-ips` to measure the benchmark of each method.

- Ruby method
- C extension
- Rust via [FFI](https://github.com/ffi/ffi)
- Rust via [Helix](https://github.com/tildeio/helix) (class method and instance method)
- Rust via [Ruru](https://github.com/d-unseductable/ruru)

See [`benchmark.rb`](benchmark.rb) for the implementations.

## Goals

- Verify if offloading **basic** math operations to Rust/C would have performance
  benefits (answer: no)
- Compare each of the different integration options to see which has the best
  tradeoff between developer productivity and performance. Opinions:
    - The C API is very well documented and easy to pick up, but it's C so it's
      hard to program safely.
    - Rust Helix has the best API but the worst performance (for this benchmark)
      by about half.
    - Rust Ruru is almost as fast as C but a pretty unfriendly and incomplete
      API (and the project appears to be dead). It also has some VALUE
      conversion quirks that are quite annoying.
    - FFI generally speaking is fast for simple things, but really challenging
      for any level of complexity (and strings).

If I were to pick from the list for a project, I would strongly consider Helix,
but also do performance comparison between Helix and C.

## Results

> ***This is not intended to be a generalized statement about the performance of
> each of these libraries, only a statement about this particular use case.***

```
Warming up --------------------------------------
         ruby method    203479 i/100ms
 rust helix instance    120885 i/100ms
    rust helix class    121661 i/100ms
      rust ffi class    161558 i/100ms
     rust ruru class    199846 i/100ms
             c class    221703 i/100ms
Calculating -------------------------------------
                      iterations per second     total iterations    time
         ruby method  4966573.4 (±6.8%) i/s -   24824438          in 5.022462s
 rust helix instance  1875397.8 (±6.1%) i/s -    9429030          in 5.046921s
    rust helix class  1852779.7 (±5.9%) i/s -    9246236          in 5.008588s
      rust ffi class  3082134.8 (±8.1%) i/s -   15348010          in 5.019943s
     rust ruru class  4275527.6 (±6.2%) i/s -   21383522          in 5.021156s
             c class  5483016.5 (±6.0%) i/s -   27491172          in 5.032074s
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

Thanks to them for providing the easy springboard.

## License

This benchmark repository is available as open source under the terms of the MIT
License, or under the license of the individual project subdirectories as
defiend in their license files, whichever is the most restrictive and doesn't
get me in legal trouble.
