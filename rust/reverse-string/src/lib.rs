pub fn reverse(input: &str) -> String {
    let mut original = input.to_owned();
    let mut reversed = String::with_capacity(original.len());
    while let Some(ch) = original.pop() {
        reversed.push(ch);
    }
    reversed
}
