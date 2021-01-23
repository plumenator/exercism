use std::collections::{HashMap, HashSet};

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let lowercase_word = word.to_lowercase();
    let lowercase_word_map = to_hashmap(&lowercase_word);
    possible_anagrams
        .iter()
        .filter(|other| {
            let lowercase_other = other.to_lowercase();
            let lowercase_other_map = to_hashmap(&lowercase_other);
            lowercase_word != lowercase_other && lowercase_word_map == lowercase_other_map
        })
        .copied()
        .collect()
}

fn to_hashmap(word: &str) -> HashMap<char, usize> {
    word.chars().fold(HashMap::new(), |mut map, c| {
        *map.entry(c).or_insert(0) += 1;
        map
    })
}
