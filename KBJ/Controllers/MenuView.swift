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
            let frameHeight: CGFloat = 135.0
            ScrollView(.vertical, showsIndicators: false) {
                let name = "Nashville Chicken Tacos"
                let type = "Taco"
                let description = "Tortilla, Chicken, Slaw"
                let price = "$12.99"
                let image = "Nashville"
                NavigationLink(destination: FoodView(name: name, type: type, description: description, price: price, image: image, item: FoodCell(foodName: name, toppings: description, image: image, price: price, type: type))) {
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                HStack {
                    Text("Special")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    Text(name)
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("Fries")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(foodFries, id: \.foodName) { food in
                                NavigationLink(destination: FoodView(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: food)) {
                                    CategoryItem(food: food)
                                }
                            }
                        }
                    }
                    .frame(height: frameHeight)
                    Text("Appetizers")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 5) {
                            ForEach(foodApps, id: \.foodName) { food in
                                NavigationLink(destination: FoodView(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: food)) {
                                    CategoryItem(food: food)
                                }
                            }
                        }
                    }
                    .frame(height: frameHeight)
                    
                    Text("Burgers")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 5) {
                            ForEach(foodBurgers, id: \.foodName) { food in
                                NavigationLink(destination: FoodView(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: food)) {
                                    CategoryItem(food: food)
                                }
                            }
                        }
                    }
                    .frame(height: frameHeight)
                    
                    Text("Sandwiches")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 5) {
                            ForEach(foodSandwiches, id: \.foodName) { food in
                                NavigationLink(destination: FoodView(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: FoodCell(foodName: food.foodName, toppings: food.toppings, image: food.image, price: food.price, type: food.type))) {
                                    CategoryItem(food: food)
                                }
                            }
                        }
                    }
                    .frame(height: frameHeight)
                    
                    Text("Salads")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 5) {
                            ForEach(foodSalads, id: \.foodName) { food in
                                NavigationLink(destination: FoodView(name: food.foodName, type: food.type, description: food.toppings, price: food.price, image: food.image, item: FoodCell(foodName: food.foodName, toppings: food.toppings, image: food.image, price: food.price, type: food.type))) {
                                    CategoryItem(food: food)
                                }
                            }
                        }
                    }
                    .frame(height: frameHeight)
                    
                }
                
            }
            
            .navigationBarTitle("Menu")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    //List Menu
    //        NavigationView {
    //            List(foodItemList, id: \.foodName) { food in
    //                HStack {
    //                    VStack {
    //                        HStack {
    //                            Text(food.foodName)
    //                                .font(.title)
    //                                .bold()
    //                            Spacer()
    //                        }
    //                        HStack {
    //                            Text(food.toppings)
    //                                .font(.caption)
    //                                .frame(alignment: .leading)
    //                            Spacer()
    //
    //                        }
    //                    }
    //                    Text(food.price)
    //                        .font(.headline)
    //                    //            Image(image)
    //                    //                .resizable()
    //                    //                .aspectRatio(contentMode: .fill)
    //                    //                .frame(width: 60, height: 60, alignment: .leading)
    //                    //                    Button (action:{
    //                    //                        foodOrdered.append(Order(foodName: food.foodName, price: food.price, place: index, type: food.image))
    //                    //                        index+=1
    //                    //                    }) {
    //                    //                        Image(systemName: "plus.square.fill")
    //                    //                    }
    //                }
    //            }
    //            .navigationBarTitle("Menu")
    //        }
    //        .navigationViewStyle(StackNavigationViewStyle())
    //    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuView()
            MenuView()
        }
        //.preferredColorScheme(.light)
    }
}

