import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(value) = problem

  value
}

pub fn remove_team_prefix(team: String) -> String {
  let assert "Team " <> team_name = team

  team_name
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [region, team] = string.split(combined, on: ",")

  #(region, remove_team_prefix(team))
}
