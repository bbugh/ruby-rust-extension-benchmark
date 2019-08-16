base_dir=$(dirname "$(realpath $0)")

cd cash_flow_c
rake compile

cd $base_dir
cd crates/cash_flow_rust_ffi
make

cd $base_dir
cd crates/cash_flow_rust_helix
rake build

cd $base_dir
cd crates/cash_flow_rust_ruru
./build-ruby.sh
