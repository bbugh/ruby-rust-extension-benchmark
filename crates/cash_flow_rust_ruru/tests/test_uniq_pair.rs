extern crate pair;

use pair::uniq_pair::find_uniq_pairs;

#[test]
fn test_if_uniq_i32() {
    let nums: [i32; 9] = [1, 3, 4, 5, 6, 2, 4, 3, 5];
    let nums_len = nums.len();

    if let Some(p) = find_uniq_pairs(&nums) {
        assert_ne!(p.len(), nums_len * nums_len);
    }
}

#[test]
fn test_if_uniq_u32() {
    let nums: [u32; 9] = [1, 3, 4, 5, 6, 2, 4, 3, 5];
    let nums_len = nums.len();

    if let Some(p) = find_uniq_pairs(&nums) {
        assert_ne!(p.len(), nums_len * nums_len);
    }
}

#[test]
fn test_if_uniq_f32() {
    let nums: [f32; 9] = [1.0, 3.2, 4.1, 5.5, 6.2, 2.1, 4.0, 3.6, 5.1];
    let nums_len = nums.len();

    if let Some(p) = find_uniq_pairs(&nums) {
        assert_ne!(p.len(), nums_len * nums_len);
    }
}

#[test]
fn test_if_uniq_i64() {
    let nums: [i64; 9] = [1, 3, 4, 5, 6, 2, 4, 3, 5];
    let nums_len = nums.len();

    if let Some(p) = find_uniq_pairs(&nums) {
        assert_ne!(p.len(), nums_len * nums_len);
    }
}

#[test]
fn test_if_uniq_u64() {
    let nums: [u64; 9] = [1, 3, 4, 5, 6, 2, 4, 3, 5];
    let nums_len = nums.len();

    if let Some(p) = find_uniq_pairs(&nums) {
        assert_ne!(p.len(), nums_len * nums_len);
    }
}

#[test]
fn test_if_uniq_str() {
    let words: [&str; 3] = ["first", "second", "third"];
    let words_len = words.len();

    if let Some(p) = find_uniq_pairs(&words) {
        assert_ne!(p.len(), words_len * words_len);
    }
}