//
//  MenuView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI

struct MenuView: View {
    @State var foodItemList = [ FoodCell(foodName: "Zed's Straight Up", toppings: "Lettuce, Tomato, Onion, Pickle, Mayo", image: "burger", price: "$7.99"),
                                FoodCell(foodName: "Royal w/ Cheese", toppings: "Lettuce, Tomato, Onion, Pickles, Maya, with Cheddar, American, Swiss or Pepperjack", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Juicy Lucy", toppings: "Mustard, Ketchup, Onions, Pickles, Stuffed w/ White American", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Patty Melt", toppings: "Sourdough, sautéed onions, swiss, secret sauce", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Black & Blue", toppings: "Cajun spiced, blue cheese & dressing, Lettuce, Tomato, Onion", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Bacon Cheese", toppings: "Cheddar, Bacon, Lettuce, Tomato, Onion, Pickles, Mayo", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Bud's Queso Burger", toppings: "Bacon, Sautéed Onions, Jalpeños", image: "burger", price: "$8.99"),
                                
                                FoodCell(foodName: "Mushroom Brie", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Bacon Egg", toppings: "Lettuce, Tomato, Onion, Mayo, Brie", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Turkey Burger", toppings: "Provolone, Basil Pesto Mayo, Balsamic Glaze, Lettuce, Tomato, Onion", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "Southwest Black Bean", toppings: "Queso, Guacamole, Chipotle Ranch, Lettuce, Tomato, Onion", image: "burger", price: "$8.99"),
                                FoodCell(foodName: "PepperJack Guacamole", toppings: "Bacon, Lettuce, Tomato, Onion, Mayo", image: "burger", price: "$9.99"),
                                FoodCell(foodName: "Smoke House BBQ", toppings: "Brisket, Bacon, Cheddar, BBQ Sauce, Jalapeños, Onion, Pickles, Mayo", image: "burger", price: "$11.99"),
                                
                                FoodCell(foodName: "Southern Fried Chicken", toppings: "Chipotle Ranch, Lettuce, Pickles", image: "sandwich", price: "$8.99"),
                                FoodCell(foodName: "Smoked Brisket Grilled Cheese", toppings: "Sourdough, Cheddar, Pepperjack, White American", image: "sandwich", price: "$9.99"),
                                FoodCell(foodName: "Steak Bomb", toppings: "Hoagie, Shaved Ribeye, Mushrooms, Onions, Peppers, White American, Provolone", image: "sandwich", price: "$10.99"),
                                FoodCell(foodName: "Tuna Steak", toppings: "Cajun Spiced, Bacon, Wasabi Mayo, Lettuce, Tomato, Onion", image: "sandwich", price: "$11.99"),
                                FoodCell(foodName: "Greek", toppings: "Greens, Feta, Kalamata Olives, Cucumber, Tomato, Red Onions, Pepperoncinis, Greek Dressing", image: "salad", price: "$7.99"),
                                FoodCell(foodName: "Blue Cheese", toppings: "iceberg, Tomato, Onion, Bacon, Blue Cheese Dressing", image: "salad", price: "$7.99"),
                                FoodCell(foodName: "Asian", toppings: "Greens, Cucumber, Tomato, Avocado, Mango, Carrots, Red Onion, Toasted Cashews, Won Tons, Sesame Ginger Vinaigrette", image: "salad", price: "$7.99"),
                                
                                FoodCell(foodName: "Regular Fries", toppings: "", image: "salad", price: "$2.49"),
                                FoodCell(foodName: "Sweet Potato Fries", toppings: "", image: "salad", price: "$3.49"),
                                FoodCell(foodName: "Truffle Parmesan Fries",toppings: "", image: "salad", price: "$3.49"),
                                FoodCell(foodName: "Tator Tots", toppings: "", image: "salad", price: "$3.49"),
                                FoodCell(foodName: "Cheese Fries", toppings: "Cheddar, Jalapeños, Bacon, Chives, Ranch", image: "fries", price: "$8.99"),
                                
                                FoodCell(foodName: "Bud’s White Queso & Chips", toppings: "", image: "salad", price: "$5.99"),
                                FoodCell(foodName: "Fried Pickles", toppings: "", image: "salad", price: "$6.99"),
                                FoodCell(foodName: "Onion Rings", toppings: "", image: "salad", price: "$6.99"),
                                FoodCell(foodName: "Bacon Wrapped Jalapeños", toppings: "", image: "salad", price: "$7.99"),
                                FoodCell(foodName: "Coleslaw",toppings: "", image: "salad", price: "$2.49")
    ]
    @State private var searchTerms = ""
    @State private var showingAlert = false
    @State var index = 0

    //    private var filteredFoods: [String] {
    //
    //    }
    var body: some View {
        //Text("hello world")
        NavigationView {
            List(foodItemList, id: \.foodName) { food in
                HStack {
                    VStack {
                        HStack {
                            Text(food.foodName)
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                        HStack {
                            Text(food.toppings)
                                .font(.caption)
                                .frame(alignment: .leading)
                            Spacer()
                            
                        }
                    }
                    Text(food.price)
                        .font(.headline)
                    //            Image(image)
                    //                .resizable()
                    //                .aspectRatio(contentMode: .fill)
                    //                .frame(width: 60, height: 60, alignment: .leading)
                    Button (action:{
                        foodOrdered.append(order(foodName: food.foodName, price: food.price, place: index))
                        index+=1
                    }) {
                        Image(systemName: "plus.square.fill")
                    }
                }
            }
            .navigationBarTitle("Menu")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
        //.preferredColorScheme(.light)
    }
}
