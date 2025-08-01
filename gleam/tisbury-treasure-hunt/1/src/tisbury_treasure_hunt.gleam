import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(letter, number) = place_location

  #(number, letter)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  treasure_location == place_location_to_treasure_location(place_location)
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let #(_, place_location) = place

  let is_treasure_in_place = fn(treasure) {
    let #(_, treasure_location) = treasure

    treasure_location_matches_place_location(place_location, treasure_location)
  }

  treasures
    |> list.filter(_, is_treasure_in_place)
    |> list.length
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  let #(place_name, _) = place

  let #(desired_treasure_name, _) = desired_treasure

  case found_treasure {
    #(found_treasure_name, _) if place_name == "Abandoned Lighthouse" -> True
    #("Amethyst Octopus", _) if place_name == "Stormy Breakwater" ->
      desired_treasure_name == "Crystal Crab" ||
      desired_treasure_name == "Glass Starfish"
    #("Vintage Pirate Hat", _) if place_name == "Harbor Managers Office"->
      desired_treasure_name == "Model Ship in Large Bottle" ||
      desired_treasure_name == "Antique Glass Fishnet Float"
    _ -> False
  }
}
