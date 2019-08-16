# pair

Example from [github.com/squiidz/pair](https://github.com/squiidz/pair)


Simple rust to ruby example with [ruru](https://github.com/d-unseductable/ruru).

you need to install `CONFIGURE_OPTS=--enable-shared rbenv install 2.3.0`

## Build
- `cargo build --release`
- `./move.sh`
- `cd ruby`
- `time ruby test_rust.rb`
- `time ruby test_ruby.rb`

## Build Gem
- `cargo build --release`
- `./move.sh`
- `cd ruby/pair`
- `gem build pair.gemspec`
- `gem install pair-0.0.1.gem`
