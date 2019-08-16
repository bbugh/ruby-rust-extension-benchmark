use std::fmt::{self, Display};
use std::cmp::{PartialEq};

#[derive(Debug, PartialEq, Clone)]
pub struct Pair<T> (pub T, pub T);

impl<T: Display> Display for Pair<T> {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({},{})", self.0, self.1)
    }
}

pub fn find_uniq_pairs<T: Clone + PartialEq>(elems: &[T]) -> Option<Vec<Pair<T>>> {
    let mut pairs: Vec<Pair<T>> = Vec::new();

    for (i, elm) in elems.iter().cloned().enumerate() {
        for e in elems[i..].iter().cloned() {
            if !pairs.iter().any(|p| *p == Pair(elm.clone(), e.clone()) ) {
                pairs.push( Pair(elm.clone(), e.clone()) );
            } else {
                continue
            }
        }
    }

    if pairs.len() == 0 {
        return None
    }
    Some(pairs)
}