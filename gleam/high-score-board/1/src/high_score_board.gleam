import gleam/dict

pub type ScoreBoard =
  dict.Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.from_list([
    #("The Best Ever", 1_000_000)
  ])
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  dict.insert(score_board, player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  dict.delete(score_board, player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case dict.get(score_board, player) {
    Ok(existing_points) -> dict.insert(score_board, player, existing_points + points)
    Error(_) -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  let monday_bonus_points = 100

  dict.map_values(score_board, fn(_player, points) {
    points + monday_bonus_points
  })
}
