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
                VStack(alignment: .leading) {
                    Text("Fries")
                        .font(.headline)
                        .padding(.leading, 15)
                        .padding(.top, 5)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(foodFries, id: \.foodName) { food in
                                CategoryItem(food: food)
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
                                CategoryItem(food: food)
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
                                CategoryItem(food: food)
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
                                CategoryItem(food: food)
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
                                CategoryItem(food: food)
                            }
                        }
                    }
                    .frame(height: frameHeight)
                    
                }
            }
            .navigationBarTitle("Menu")
        }

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
        MenuView()
        //.preferredColorScheme(.light)
    }
}

