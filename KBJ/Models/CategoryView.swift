//
//  CategoryItem.swift
//  KBJ
//
//  Created by Other user on 7/23/21.
//

import SwiftUI

struct CategoryItem: View {
    var food: FoodCell

    var body: some View {
        VStack(alignment: .leading) {
            Image(food.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text(food.foodName)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(food: FoodCell(foodName: "Nick", toppings: "yunny", image: "Burger", price: "String"))
    }
}
