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
