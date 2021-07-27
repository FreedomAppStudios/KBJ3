//
//  OrderView.swift
//  KBJ
//
//  Created by Nick Morris on 6/18/21.
//

import SwiftUI
import Firebase
var itemNumber = 0
struct OrderView: View {
    @State var show = false
    @State var cookShow = false
    @State var orderedItems = [OrderItem]()
    @State var kill = 0
    @State var killed = [Int]()
    @State var hasRun = false
    @State var refreshed = false
    @State var sum = 0.0
    @State var firstName = ""
    @State var lastName = ""
    @State var phoneNumber = ""
    @State var cookMessage = "R"
    let degreesOfDoneness = ["R", "MR", "M", "MW", "WD",""]
    @State var allTemps = [Int]()
    @State var message = "Nothing Ordered"
    @State var rotate = 0
    @State var lastPlace = 0
    @State var new = 0
    let buttonWidth: CGFloat = 175
    let buttonHeight: CGFloat = 45
    let db = Firestore.firestore()
    var body: some View {
        NavigationView {
            
            if orderedItems.count == 0 {
                VStack {
                    Text(message)
                        .font(.title)
                        .bold()
                        .italic()
                        .onAppear(perform: {
                            orderedItems.append(contentsOf: foodOrdered)
                            foodOrdered = []
                            hasRun = true
                            sum = 0
                            
                        })
                    Spacer()
                        .navigationTitle("Order")
                    
                }
            } else {
                ZStack {
                    VStack {
                        HStack {
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                        }
                        TextField("Phone Number", text: $phoneNumber)
                        
                        List(orderedItems, id: \.id) { thing in
                            HStack {
                                let item = thing.item
                                Text(item.foodName)
                                    .bold()
                                    .font(.title2)
                                    .onAppear(perform: {
                                        orderedItems.append(contentsOf: foodOrdered)
                                        foodOrdered = []
                                    })
                                Spacer()
                                Text(item.price)
                                    .bold()
                                    .font(.title)
                                    .onAppear(perform: {
                                        var price = item.price
                                        price.remove(at: price.startIndex)
                                        sum += Double(price)!
                                    })
                                
                            }
                        }
                        Button {
                            let isEmptyFirst = firstName == ""
                            let isEmptyLast = lastName == ""
                            let isEmptyPhone = phoneNumber == ""
                            if isEmptyFirst == false {
                                if isEmptyLast == false {
                                    if isEmptyPhone == false {
                                        placeOrder(order: orderedItems, first: firstName, last: lastName, phone: phoneNumber)
                                        message = "Order Placed!"
                                        foodOrdered = []
                                        orderedItems = []
                                    }
                                }
                            }
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                Text("Place Order")
                                    .foregroundColor(.white)
                                
                            }
                            Button {
                                message = "Nothing Ordered"
                                foodOrdered = []
                                orderedItems = []
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                                    Text("Clear Order")
                                        .foregroundColor(.white)
                                    
                                }
                            }
                        }
                        Spacer()
                        RoundedRectangle(cornerRadius: 25.0)
                            .opacity(0)
                            .frame(width: 100, height: 75, alignment: .center)
                            .navigationTitle("Order")
                    }
                }
                
                
            }
        }
        .navigationTitle("Order")
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

func placeOrder(order : Array<OrderItem>, first: String, last: String, phone: String) {
    var simList = [SimpleOrder]()
    var fullOrder = "Name: \(first + " " + last) \nPhone Number: \(phone)\n"
    let timeStamp = Date().timeIntervalSince1970
    for item in order {
        let foodName = "Item: " + String(item.item.foodName)
        let cookTemp = "Temp: " + String(item.temp)
        simList.append(SimpleOrder(name: foodName, temp: cookTemp))
    }
    for order in simList {
        fullOrder.append("\nItem: \(order.name)")
        fullOrder.append("\nTemp: \(order.temp)\n")
    }
    db.collection("z-orders").addDocument(data: [
        "order" : fullOrder,
        "time" : timeStamp
    ])
}


//                                Button (action:{
//                                    var price = item.price
//                                    price.remove(at: price.startIndex)
//                                    sum -= Double(price)!
//
//                                    kill = 0
//                                    for num in killed {
//                                        if kill > num {
//                                            kill -= 1
//                                        }
//                                    }
//                                    killed.append(kill)
//                                    orderedItems.remove(at: kill)
//                                }) {
//                                    Image(systemName: "minus.circle.fill")
//                                }
//                                .buttonStyle(BorderlessButtonStyle())
//                                Button  {
//                                    withAnimation{
//                                        show.toggle()
//                                    }
//                                } label: {
//                                    Image(systemName: "info.circle.fill")
//                                        .foregroundColor(.white)
//                                }
