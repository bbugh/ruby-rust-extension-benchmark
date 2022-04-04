# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "cash_flow_rust_magnus"
  spec.version = "0.1.0"
  spec.summary = "-"
  spec.files = Dir["lib/**/*.rb"].concat(Dir["ext/cash_flow_rust_magnus/src/**/*.rs"]) << "ext/cash_flow_rust_magnus/Cargo.toml" << "ext/cash_flow_rust_magnus/Cargo.lock" << "ext/cash_flow_rust_magnus/Rakefile"
  spec.extensions = ["ext/cash_flow_rust_magnus/Rakefile"]
  spec.authors = ["Mat Sadler"]
  spec.license = "MIT"

  spec.requirements = ["Rust >= 1.51.0"]

  spec.add_runtime_dependency "rake", "> 1"
end
