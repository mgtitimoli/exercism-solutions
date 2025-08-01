import gleam/string

pub fn message(log_line: String) -> String {
  let message = case string.trim(log_line) {
    "[ERROR]: " <> message -> message
    "[INFO]: " <> message -> message
    "[WARNING]: " <> message -> message
    _ -> ""
  }

  string.trim(message)
}

pub fn log_level(log_line: String) -> String {
  case string.trim(log_line) {
    "[ERROR]: " <> _ -> "error"
    "[INFO]: " <> _ -> "info"
    "[WARNING]: " <> _ -> "warning"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
