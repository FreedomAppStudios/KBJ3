//
//  FoodModel.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import Foundation
import SwiftUI
var foodOrdered = [OrderItem]()
struct FoodCellView: View {
    let foodName: String
    let toppings: String
    let image: String
    let price: String
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(foodName)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Text(toppings)
                        .font(.caption)
                        .frame(alignment: .leading)
                        .foregroundColor(.white)
                    Spacer()
                    
                }
            }
            Text(price)
                .font(.headline)
                .foregroundColor(.white)
            //            Image(image)
            //                .resizable()
            //                .aspectRatio(contentMode: .fill)
            //                .frame(width: 60, height: 60, alignment: .leading)
        }
    }
}
struct FriesRow: View {
    let fry: String
    let price: String
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(fry)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Text(price)
                .font(.headline)
                .foregroundColor(.white)
            //            Image("fries")
            //                .resizable()
            //                .aspectRatio(contentMode: .fill)
            //                .frame(width: 60, height: 60, alignment: .leading)
        }
    }
}
struct FoodCell {
    let foodName: String
    let toppings: String
    let image: String
    let price: String
    let type: String
}
struct OrderItem: Identifiable {
    let item: FoodCell
    let temp: String
    let cheese: String
    let modifications: String
    let id = UUID()
}
struct SimpleOrder: Identifiable {
    let name: String
    let temp: String
    let special: String
    let id = UUID()
}
struct Order {
    var foodName: String
    let price: String
    let place: Int
    let type: String
    var cooked = 0
    mutating func cookUp() {
        if cooked < 5 {
            cooked += 1
        } else {
            cooked = 0
        }
        
    }
}
let foodBurgers = [
    FoodCell(foodName: "Zed's Straight Up", toppings: "Lettuce, Tomato, Onion, Pickle, Mayo", image: "zeds", price: "$7.99", type: "Burger"),
    FoodCell(foodName: "Royal w/ Cheese", toppings: "Lettuce, Tomato, Onion, Pickles, Mayo, with Cheddar, American, Swiss or Pepperjack", image: "royal", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Juicy Lucy", toppings: "Mustard, Ketchup, Onions, Pickles, Stuffed w/ White American", image: "jl", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Patty Melt", toppings: "Sourdough, sautéed onions, swiss, secret sauce", image: "patty", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Black & Blue", toppings: "Cajun spiced, blue cheese & dressing, Lettuce, Tomato, Onion", image: "b&b", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Bacon Cheese", toppings: "Cheddar, Bacon, Lettuce, Tomato, Onion, Pickles, Mayo", image: "bacon cheese", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Bud's Queso Burger", toppings: "Bacon, Sautéed Onions, Jalpeños", image: "queso burger", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Mushroom Brie", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "mush", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Bacon Egg", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "bacon egg", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Turkey Burger", toppings: "Provolone, Basil Pesto Mayo, Balsamic Glaze, Lettuce, Tomato, Onion", image: "turkey", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "Southwest Black Bean", toppings: "Queso, Guacamole, Chipotle Ranch, Lettuce, Tomato, Onion", image: "veggie", price: "$8.99", type: "Burger"),
    FoodCell(foodName: "PepperJack Guacamole", toppings: "Bacon, Lettuce, Tomato, Onion, Mayo", image: "guac", price: "$9.99", type: "Burger"),
    FoodCell(foodName: "Smoke House BBQ", toppings: "Brisket, Bacon, Cheddar, BBQ Sauce, Jalapeños, Onion, Pickles, Mayo", image: "smoke", price: "$11.99", type: "Burger"),
]
let foodSandwiches =
    [FoodCell(foodName: "Southern Fried Chicken", toppings: "Chipotle Ranch, Lettuce, Pickles", image: "fry chicken", price: "$8.99", type: "Sandwich"),
     FoodCell(foodName: "Smoked Brisket Grilled Cheese", toppings: "Sourdough, Cheddar, Pepperjack, White American", image: "brisket", price: "$9.99", type: "Sandwich"),
     FoodCell(foodName: "Steak Bomb", toppings: "Hoagie, Shaved Ribeye, Mushrooms, Onions, Peppers, White American, Provolone", image: "steak", price: "$10.99", type: "Sandwich"),
     FoodCell(foodName: "Tuna Steak", toppings: "Cajun Spiced, Bacon, Wasabi Mayo, Lettuce, Tomato, Onion", image: "tuna", price: "$11.99", type: "Sandwich")
    ]
let foodSalads = [
    FoodCell(foodName: "Greek", toppings: "Greens, Feta, Kalamata Olives, Cucumber, Tomato, Red Onions, Pepperoncinis, Greek Dressing", image: "greek", price: "$7.99", type: "Salad"),
    FoodCell(foodName: "Blue Cheese", toppings: "iceberg, Tomato, Onion, Bacon, Blue Cheese Dressing", image: "blue cheese", price: "$7.99", type: "Salad"),
    FoodCell(foodName: "Asian", toppings: "Greens, Cucumber, Tomato, Avocado, Mango, Carrots, Red Onion, Toasted Cashews, Won Tons, Sesame Ginger Vinaigrette", image: "asian", price: "$7.99", type: "Salad")
]
let foodFries = [
    FoodCell(foodName: "Regular Fries", toppings: "", image: "fries", price: "$2.49", type: "Fry"),
    FoodCell(foodName: "Sweet Potato Fries", toppings: "", image: "sweet", price: "$3.49", type: "Fry"),
    FoodCell(foodName: "Truffle Parmesan Fries",toppings: "", image: "truffle", price: "$3.49", type: "Fry"),
    FoodCell(foodName: "Tator Tots", toppings: "", image: "fries", price: "$3.49", type: "Fry (basically)")
]
let foodApps = [
    FoodCell(foodName: "Cheese Fries", toppings: "Cheddar, Jalapeños, Bacon, Chives, Ranch", image: "cheeseFries", price: "$8.99", type: "Appetizer"),
    
    FoodCell(foodName: "Chips & Queso", toppings: "", image: "queso", price: "$5.99", type: "Appetizer"),
    FoodCell(foodName: "Fried Pickles", toppings: "", image: "pickles", price: "$6.99", type: "Appetizer"),
    FoodCell(foodName: "Onion Rings", toppings: "", image: "onion rings", price: "$6.99", type: "Appetizer"),
    FoodCell(foodName: "Stuffed Jalapeños", toppings: "", image: "japs", price: "$7.99", type: "Appetizer"),
    FoodCell(foodName: "Coleslaw",toppings: "", image: "coleslaw", price: "$2.49", type: "Appetizer")
]
