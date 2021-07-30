//
//  MenuView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI
import Firebase

struct MenuView: View {
    @State var urlFire = "https://i.ytimg.com/vi/lcQvkhNXoNU/maxresdefault.jpg"
    @State var name = ""
    @State var type = ""
    @State var description = ""
    @State var price = ""
    let db = Firestore.firestore()
    var body: some View {
        NavigationView {
            let frameHeight: CGFloat = 135.0
            ScrollView(.vertical, showsIndicators: false) {
                Text("")
                    .onAppear() {
                        db.collection("z-special").addSnapshotListener {
                            querySnapshot, error in
                            if let e = error {
                                name = "error fetching server"
                                print(e)
                            } else {
                                
                                //staff = ["found documents"]
                                if let snapshotDocuments = querySnapshot?.documents {
                                    //staff = ["got inside"]
                                    for doc in snapshotDocuments {
                                        let data = doc.data()
                                        if let n = data["name"] as? String,
                                           let d = data["description"] as? String,
                                           let i = data["image"] as? String,
                                           let p = data["price"] as? String,
                                           let t = data["type"] as? String {
                                            urlFire = i
                                            name = n
                                            type = t
                                            description = d
                                            price = p
                                        }
                                    }
                                }
                            }
                        }
                    }
                NavigationLink(destination: FoodView(name: name, type: type, description: description, price: price, image: urlFire, item: FoodCell(foodName: name, toppings: description, image: urlFire, price: price, type: type))) {
                    Image("wifi")
                        .data(url: URL(string: urlFire)!)
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
                
                .navigationBarTitle("Menu")
            }
            //        .navigationViewStyle(StackNavigationViewStyle())
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
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuView()
        }
        //.preferredColorScheme(.light)
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
