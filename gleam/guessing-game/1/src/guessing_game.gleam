pub fn reply(guess: Int) -> String {
  let result = 42

  let close_diff = 1

  let close_low = result - close_diff

  let close_high = result + close_diff

  case guess {
    number if number == close_low || number == close_high -> "So close"
    number if number < close_low -> "Too low"
    number if number > close_high -> "Too high"
    _ -> "Correct"
  }
}
