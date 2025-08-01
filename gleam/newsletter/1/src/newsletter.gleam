import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  path
  |> simplifile.read
  |> result.map(string.split(_, on: "\n"))
  |> result.map(list.filter(_, fn(email) { !string.is_empty(email) }))
  |> result.nil_error
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  path
  |> simplifile.create_file
  |> result.nil_error
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  path
  |> simplifile.append(email <> "\n")
  |> result.nil_error
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  log_path
  |> create_log_file
  |> result.replace(emails_path)
  |> result.try(read_emails)
  |> result.map(list.map(_, fn(email) {
    email
    |> send_email
    |> result.replace(email)
    |> result.map(log_sent_email(log_path, _))
  }))
  |> result.replace(Nil)
}
