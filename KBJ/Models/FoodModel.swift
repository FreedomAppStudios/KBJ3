//
//  FoodModel.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import Foundation
import SwiftUI
var foodOrdered = [Order]()
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
    FoodCell(foodName: "Zed's Straight Up", toppings: "Lettuce, Tomato, Onion, Pickle, Mayo", image: "Burger", price: "$7.99"),
    FoodCell(foodName: "Royal w/ Cheese", toppings: "Lettuce, Tomato, Onion, Pickles, Maya, with Cheddar, American, Swiss or Pepperjack", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Juicy Lucy", toppings: "Mustard, Ketchup, Onions, Pickles, Stuffed w/ White American", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Patty Melt", toppings: "Sourdough, sautéed onions, swiss, secret sauce", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Black & Blue", toppings: "Cajun spiced, blue cheese & dressing, Lettuce, Tomato, Onion", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Bacon Cheese", toppings: "Cheddar, Bacon, Lettuce, Tomato, Onion, Pickles, Mayo", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Bud's Queso Burger", toppings: "Bacon, Sautéed Onions, Jalpeños", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Mushroom Brie", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Bacon Egg", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Turkey Burger", toppings: "Provolone, Basil Pesto Mayo, Balsamic Glaze, Lettuce, Tomato, Onion", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "Southwest Black Bean", toppings: "Queso, Guacamole, Chipotle Ranch, Lettuce, Tomato, Onion", image: "Burger", price: "$8.99"),
    FoodCell(foodName: "PepperJack Guacamole", toppings: "Bacon, Lettuce, Tomato, Onion, Mayo", image: "Burger", price: "$9.99"),
    FoodCell(foodName: "Smoke House BBQ", toppings: "Brisket, Bacon, Cheddar, BBQ Sauce, Jalapeños, Onion, Pickles, Mayo", image: "Burger", price: "$11.99"),
]
let foodSandwiches =
    [FoodCell(foodName: "Southern Fried Chicken", toppings: "Chipotle Ranch, Lettuce, Pickles", image: "sandwich", price: "$8.99"),
     FoodCell(foodName: "Smoked Brisket Grilled Cheese", toppings: "Sourdough, Cheddar, Pepperjack, White American", image: "sandwich", price: "$9.99"),
     FoodCell(foodName: "Steak Bomb", toppings: "Hoagie, Shaved Ribeye, Mushrooms, Onions, Peppers, White American, Provolone", image: "sandwich", price: "$10.99"),
     FoodCell(foodName: "Tuna Steak", toppings: "Cajun Spiced, Bacon, Wasabi Mayo, Lettuce, Tomato, Onion", image: "sandwich", price: "$11.99")
    ]
let foodSalads = [
    FoodCell(foodName: "Greek", toppings: "Greens, Feta, Kalamata Olives, Cucumber, Tomato, Red Onions, Pepperoncinis, Greek Dressing", image: "salad", price: "$7.99"),
    FoodCell(foodName: "Blue Cheese", toppings: "iceberg, Tomato, Onion, Bacon, Blue Cheese Dressing", image: "salad", price: "$7.99"),
    FoodCell(foodName: "Asian", toppings: "Greens, Cucumber, Tomato, Avocado, Mango, Carrots, Red Onion, Toasted Cashews, Won Tons, Sesame Ginger Vinaigrette", image: "salad", price: "$7.99")
]
let foodFries = [
    FoodCell(foodName: "Regular Fries", toppings: "", image: "fries", price: "$2.49"),
    FoodCell(foodName: "Sweet Potato Fries", toppings: "", image: "fries", price: "$3.49"),
    FoodCell(foodName: "Truffle Parmesan Fries",toppings: "", image: "fries", price: "$3.49"),
    FoodCell(foodName: "Tator Tots", toppings: "", image: "fries", price: "$3.49")
]
let foodApps = [
    FoodCell(foodName: "Cheese Fries", toppings: "Cheddar, Jalapeños, Bacon, Chives, Ranch", image: "cheeseFries", price: "$8.99"),
    
    FoodCell(foodName: "Bud’s White Queso & Chips", toppings: "", image: "onionRings", price: "$5.99"),
    FoodCell(foodName: "Fried Pickles", toppings: "", image: "onionRings", price: "$6.99"),
    FoodCell(foodName: "Onion Rings", toppings: "", image: "onionRings", price: "$6.99"),
    FoodCell(foodName: "Bacon Wrapped Jalapeños", toppings: "", image: "onionRings", price: "$7.99"),
    FoodCell(foodName: "Coleslaw",toppings: "", image: "onionRings", price: "$2.49")
]
