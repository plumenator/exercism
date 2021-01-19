#[derive(PartialEq, Eq, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self {
            hours: 0,
            minutes: 0,
        }
        .add_minutes(hours * 60 + minutes)
    }

    pub fn add_minutes(&self, excess_minutes: i32) -> Self {
        let negmod = |x, l| x % l + if x < 0 { l } else { 0 };
        let total_minutes = negmod(self.hours * 60 + self.minutes + excess_minutes, 24 * 60);
        let hours = total_minutes / 60;
        let minutes = total_minutes - hours * 60;
        Self { hours, minutes }
    }
}

impl std::fmt::Display for Clock {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
