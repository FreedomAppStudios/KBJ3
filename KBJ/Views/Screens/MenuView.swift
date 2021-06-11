//
//  MenuView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            List{
                Group {
                    FoodCell(foodName: "Zed's Straight Up", toppings: "Lettuce, Tomato, Onion, Pickle, Mayo", image: "burger", price: "$7.99")
                    FoodCell(foodName: "Royal w/ Cheese", toppings: "Lettuce, Tomato, Onion, Pickles, Maya, with Cheddar, American, Swiss or Pepperjack", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Juicy Lucy", toppings: "Mustard, Ketchup, Onions, Pickles, Stuffed w/ White American", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Patty Melt", toppings: "Sourdough, sautéed onions, swiss, secret sauce", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Black & Blue", toppings: "Cajun spiced, blue cheese & dressing, Lettuce, Tomato, Onion", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Bacon Cheese", toppings: "Cheddar, Bacon, Lettuce, Tomato, Onion, Pickles, Mayo", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Bud's Queso Burger", toppings: "Bacon, Sautéed Onions, Jalpeños", image: "burger", price: "$8.99")
                }
                .listRowBackground(Color.red)
                Group {
                    FoodCell(foodName: "Mushroom Brie", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Bacon Egg", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Turkey Burger", toppings: "Provolone, Basil Pesto Mayo, Balsamic Glaze, Lettuce, Tomato, Onion", image: "burger", price: "$8.99")
                    FoodCell(foodName: "Southwest Black Bean", toppings: "Queso, Guacamole, Chipotle Ranch, Lettuce, Tomato, Onion", image: "burger", price: "$8.99")
                    FoodCell(foodName: "PepperJack Guacamole", toppings: "Bacon, Lettuce, Tomato, Onion, Mayo", image: "burger", price: "$9.99")
                    FoodCell(foodName: "Smoke House BBQ", toppings: "Brisket, Bacon, Cheddar, BBQ Sauce, Jalapeños, Onion, Pickles, Mayo", image: "burger", price: "$11.99")
                }
                .listRowBackground(Color.red)
                Group {
                    FoodCell(foodName: "Southern Fried Chicken", toppings: "Chipotle Ranch, Lettuce, Pickles", image: "sandwich", price: "$8.99")
                    FoodCell(foodName: "Smoked Brisket Grilled Cheese", toppings: "Sourdough, Cheddar, Pepperjack, White American", image: "sandwich", price: "$9.99")
                    FoodCell(foodName: "Steak Bomb", toppings: "Hoagie, Shaved Ribeye, Mushrooms, Onions, Peppers, White American, Provolone", image: "sandwich", price: "$10.99")
                    FoodCell(foodName: "Tuna Steak", toppings: "Cajun Spiced, Bacon, Wasabi Mayo, Lettuce, Tomato, Onion", image: "sandwich", price: "$11.99")
                }
                .listRowBackground(Color.red)
                Group {
                    FoodCell(foodName: "Greek", toppings: "Greens, Feta, Kalamata Olives, Cucumber, Tomato, Red Onions, Pepperoncinis, Greek Dressing", image: "salad", price: "$7.99")
                    FoodCell(foodName: "Blue Cheese", toppings: "iceberg, Tomato, Onion, Bacon, Blue Cheese Dressing", image: "salad", price: "$7.99")
                    FoodCell(foodName: "Asian", toppings: "Greens, Cucumber, Tomato, Avocado, Mango, Carrots, Red Onion, Toasted Cashews, Won Tons, Sesame Ginger Vinaigrette", image: "salad", price: "$7.99")
                }
                .listRowBackground(Color.red)
                Group {
                    FriesRow(fry: "Regular Fries", price: "$2.49")
                    FriesRow(fry: "Sweet Potato Fries", price: "$3.49")
                    FriesRow(fry: "Truffle Parmesan Fries", price: "$3.49")
                    FriesRow(fry: "Tator Tots", price: "$3.49")
                    FoodCell(foodName: "Cheese Fries", toppings: "Cheddar, Jalapeños, Bacon, Chives, Ranch", image: "fries", price: "$8.99")
                }
                .listRowBackground(Color.red)
                Group {
                    FriesRow(fry: "Bud’s White Queso & Chips", price: "$5.99")
                    FriesRow(fry: "Fried Pickles", price: "$6.99")
                    FriesRow(fry: "Onion Rings", price: "$6.99")
                    FriesRow(fry: "Bacon Wrapped Jalapeños", price: "$7.99")
                    FriesRow(fry: "Coleslaw", price: "$2.49")
                }
                .listRowBackground(Color.red)
            }
            .navigationBarTitle("Menu")
            .foregroundColor(.black)
        }
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .preferredColorScheme(.light)
    }
}
