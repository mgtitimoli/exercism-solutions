pub fn today(days: List(Int)) -> Int {
  case days {
    [today_bird_count, ..] -> today_bird_count
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1] 
    [today_bird_count, ..rest] -> [today_bird_count + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [bird_count, ..rest] -> bird_count == 0 || has_day_without_birds(rest) 
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [bird_count, ..rest] -> bird_count + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [bird_count, ..rest] -> busy_days(rest) + case bird_count >= 5 {
      True -> 1
      False -> 0
    }
  }
}
