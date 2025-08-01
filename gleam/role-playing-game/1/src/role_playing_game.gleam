import gleam/int
import gleam/option.{type Option, Some, None}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health == 0 {
    False -> None
    True -> case player.level >= 10 {
      False -> Some(Player(..player, health: 100))
      True -> Some(Player(..player, health: 100, mana: Some(100)))
    }
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
    Some(mana) -> case cost <= mana {
      False -> #(player, 0)
      True -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
    } 
  }
}
