import gleam/list

// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn do_pizza_price(pizza: Pizza, extra_price: Int) -> Int {
  case pizza {
    Margherita -> 7 + extra_price
    Caprese -> 9 + extra_price
    Formaggio -> 10 + extra_price
    ExtraSauce(pizza_with_extra) -> do_pizza_price(pizza_with_extra, extra_price + 1)
    ExtraToppings(pizza_with_extra) -> do_pizza_price(pizza_with_extra, extra_price + 2)
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_price(pizza, 0)
}

fn do_order_price(pizzas: List(Pizza), total_price: Int) {
    case pizzas {
      [] -> total_price
      [pizza, ..rest] -> do_order_price(rest, total_price + pizza_price(pizza))
    }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case list.length(order) {
    1 -> do_order_price(order, 3)
    2 -> do_order_price(order, 2)
    _ -> do_order_price(order, 0)
  }
}
