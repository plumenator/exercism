pub fn reverse(input: &str) -> String {
    let mut reversed = String::new();
    for ch in input.chars().rev() {
        reversed.push(ch);
    }
    reversed
}
