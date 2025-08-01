import gleam/list

// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn pizza_price_rec(pizza: Pizza, extra_price: Int) -> Int {
  case pizza {
    Margherita -> 7 + extra_price
    Caprese -> 9 + extra_price
    Formaggio -> 10 + extra_price
    ExtraSauce(pizza_with_extra) -> pizza_price_rec(pizza_with_extra, extra_price + 1)
    ExtraToppings(pizza_with_extra) -> pizza_price_rec(pizza_with_extra, extra_price + 2)
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_rec(pizza, 0)
}

fn order_price_rec(pizzas: List(Pizza), total_price: Int) {
    case pizzas {
      [] -> total_price
      [pizza, ..rest] -> order_price_rec(rest, total_price + pizza_price(pizza))
    }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case list.length(order) {
    1 -> order_price_rec(order, 3)
    2 -> order_price_rec(order, 2)
    _ -> order_price_rec(order, 0)
  }
}
