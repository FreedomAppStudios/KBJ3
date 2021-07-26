//
//  FoodView.swift
//  KBJ
//
//  Created by Other user on 7/23/21.
//

import SwiftUI
import Firebase
struct FoodView: View {
    @State var cookTemp = ""
    let name: String
    let type: String
    let description: String
    let price: String
    let image: String
    let buttonHeight: CGFloat = 35
    let buttonWidth: CGFloat = 250
    let item : FoodCell
    @State var isBurger = false
    let db = Firestore.firestore()
    
    @State var isAccepting = false
    
    @State var timeRemaining = 0
    @State var isShowing = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var clicked = false
    var body: some View {
        ZStack {
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        ItemView(pic: image)
                            .onAppear {
                                db.collection("z-accept").addSnapshotListener { querySnapshot, error in
                                    if let e = error {
                                        //
                                        print(e)
                                    } else {
                                        //staff = ["found documents"]
                                        if let snapshotDocuments = querySnapshot?.documents {
                                            //staff = ["got inside"]
                                            for doc in snapshotDocuments {
                                                //staff = ["even farther"]
                                                let data = doc.data()
                                                if let remote = data["today"] as? Bool{
                                                    isAccepting = remote
                                                }
                                            }
                                        }
                                    }
                                }
                            }
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
                    
                    Text("Description")
                        .font(.title2)
                        .onAppear(perform: {
                            let burgDet = type == "Burger"
                            if burgDet == true {
                                clicked = false
                                isBurger = true
                            } else {
                                clicked = true
                                cookTemp = "NA"
                            }
                        })
                    Text(description)
                }
                .padding()
                
                Spacer()
                if isAccepting == true {
                    if isBurger == true {
                        ScrollView{
                            Button(action: {
                                cookTemp = "Rare"
                                click()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                        .foregroundColor(.red)
                                    Text("Rare")
                                        .foregroundColor(.white)
                                    
                                }
                            })
                            Button(action: {
                                cookTemp = "Medium Rare"
                                click()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                        .foregroundColor(.red)
                                    Text("Medium Rare")
                                        .foregroundColor(.white)
                                    
                                }
                            })
                            Button(action: {
                                cookTemp = "Medium"
                                click()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                        .foregroundColor(.red)
                                    Text("Medium")
                                        .foregroundColor(.white)
                                    
                                }
                            })
                            Button(action: {
                                cookTemp = "Medium Well"
                                click()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                        .foregroundColor(.red)
                                    Text("Medium Well")
                                        .foregroundColor(.white)
                                    
                                }
                            })
                            Button(action: {
                                cookTemp = "Well Done"
                                click()
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                        .foregroundColor(.red)
                                    Text("Well Done")
                                        .foregroundColor(.white)
                                    
                                }
                            })
                            
                            //Spacer
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                .opacity(0.0)
                        }
                    }
                    if clicked == true {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 300, height: 30, alignment: .center)
                                .luminanceToAlpha()
                            Button(action: {
                                foodOrdered.append(OrderItem(item: item, temp: cookTemp))
                                timeRemaining = 2
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                    Text("Add to Order")
                                        .foregroundColor(.white)
                                        .onReceive(timer) { _ in
                                            if timeRemaining > 1 {
                                                toShow()
                                                timeRemaining -= 1
                                            }
                                            else {
                                                showed()
                                                timeRemaining = 0
                                            }
                                        }
                                    
                                }
                            })
                        }
                    }
                    
                }
                Spacer()
            }
            if isShowing == true {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                    Text("Added")
                        .font(.title)
                        .bold()
                        
                        .frame(width: 200, height: 200, alignment: .center)
                        .foregroundColor(.primary)
                }
            }
            
        }
    }
    func click() {
        withAnimation{
            clicked.toggle()
        }
    }
    func toShow() {
        withAnimation{
            isShowing = true
        }
    }
    func showed() {
        withAnimation{
            isShowing = false
        }
    }
}
struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        let food = FoodCell(foodName: "Zed's", toppings: "L,T,O,P, M", image: "fry chicken", price: "$8.99", type: "Chicken")
        FoodView(name: "Zed's", type: "Burger", description: "L,T,O,P, M", price: "$8.99", image: "fry chicken", item: food)
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





