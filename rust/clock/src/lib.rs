mod clock {
    #[derive(PartialEq, Eq, Debug)]
    pub struct Clock {
        minutes: i32,
    }

    impl Clock {
        pub fn new(hours: i32, minutes: i32) -> Self {
            Self { minutes: 0 }.add_minutes(hours * 60 + minutes)
        }

        pub fn add_minutes(&self, excess_minutes: i32) -> Self {
            let negmod = |x, l| x % l + if x < 0 { l } else { 0 };
            let minutes = negmod(self.minutes + excess_minutes, 24 * 60);
            Self { minutes }
        }

        fn hours_and_minutes(&self) -> (i32, i32) {
            let hours = self.minutes / 60;
            let minutes = self.minutes - hours * 60;
            (hours, minutes)
        }
    }

    impl std::fmt::Display for Clock {
        fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
            let (hours, minutes) = self.hours_and_minutes();
            write!(f, "{:02}:{:02}", hours, minutes)
        }
    }
}

pub use crate::clock::Clock;
