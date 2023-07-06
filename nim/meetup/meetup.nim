import std/[times, sugar, sequtils]

type
  Schedule* = enum
    Teenth, First, Second, Third, Fourth, Last

proc meetup*(year: int, month: int, schedule: Schedule, day: WeekDay): string =
  let start = dateTime(year, month.Month, 1)
  let days = collect:
    for monthDay in 0..<getDaysInMonth(month.Month, year):
      let date = start + monthDay.days
      if date.weekday == day:
        date
  let date = case schedule
             of Teenth: days.filterIt(it.monthday in 13..19)[0]
             of First..Fourth: days[schedule.ord - 1]
             of Last: days[^1]
  date.format("YYYY-MM-dd")
