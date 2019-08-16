#[macro_use]
extern crate ruru;

use ruru::{Class, Array, Hash, Object, Fixnum, AnyObject};

pub mod uniq_pair;
use uniq_pair::{find_uniq_pairs};

methods!(
    Array,
    itself,

    fn uniq_pairs() -> Hash {
        let v = itself.into_iter().collect::<Vec<AnyObject>>();
        let mut h = Hash::new();
        if let Some(pairs) = find_uniq_pairs(v.as_slice()) {
            for (i, p) in pairs.iter().cloned().enumerate() {
                let mut a = Array::new().push(p.0).push(p.1);
                h.store(Fixnum::new(i as i64), a);
            }
        }
        return h
    }
);

#[no_mangle]
pub extern fn initialize() {
    Class::from_existing("Array").define(|itself| {
        itself.def("uniq_pairs", uniq_pairs);
    });
}