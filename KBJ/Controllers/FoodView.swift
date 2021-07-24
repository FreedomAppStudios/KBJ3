//
//  FoodView.swift
//  KBJ
//
//  Created by Other user on 7/23/21.
//

import SwiftUI

struct FoodView: View {
    let name: String
    let type: String
    let description: String
    let price: String
    let image: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    ItemView(pic: image)
                    Spacer()
                }
                Text(name)
                    .font(.title)
                
                HStack {
                    Text(type)
                    Spacer()
                    Text(price)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("Details")
                    .font(.title2)
                Text(description)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(name: "Zed's", type: "Burger", description: "L,T,O,P, M", price: "$8.99", image: "Burger")
    }
}
struct ItemView: View {
    let pic : String
    var body: some View {
        Image(pic)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 350, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .overlay(RoundedRectangle(cornerRadius: 20.0)
                        .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
        .shadow(radius: 7)
    }
}
