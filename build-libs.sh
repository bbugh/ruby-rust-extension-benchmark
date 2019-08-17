base_dir=$(dirname "$(realpath $0)")

cd cash_flow_c
bundle install --quiet
rake compile

cd $base_dir
cd crates/cash_flow_rust_ffi
bundle install --quiet
make

cd $base_dir
cd crates/cash_flow_rust_helix
bundle install --quiet
rake build

cd $base_dir
cd crates/cash_flow_rust_ruru
bundle install --quiet
./build-ruby.sh

cd $base_dir
cd crates/cash_flow_rust_rutie
bin/setup
