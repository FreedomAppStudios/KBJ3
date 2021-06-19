//
//  OrderView.swift
//  KBJ
//
//  Created by Nick Morris on 6/18/21.
//

import SwiftUI
var itemNumber = 0
struct OrderView: View {
    @State var orderedItems = [order]()
    @State var kill = 0
    @State var killed = [Int]()
    @State var hasRun = false
    @State var refreshed = false
    @State var sum = 0.0
    var body: some View {
        NavigationView {
            if orderedItems.count == 0 {
                VStack {
                    Text("Nothing Ordered")
                        .font(.title)
                        .bold()
                        .italic()
                        .onAppear(perform: {
                            if hasRun == false {
                                orderedItems.append(contentsOf: foodOrdered)
                                foodOrdered = []
                                hasRun = true
                            }
                            
                        })
                    Spacer()
                        .navigationTitle("Order")
                    
                }
            } else {
                VStack {
                    List(orderedItems, id: \.foodName) { item in
                        HStack {
                            Text(item.foodName)
                                .bold()
                                .font(.title)
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
                            Button (action:{
                                var price = item.price
                                price.remove(at: price.startIndex)
                                sum -= Double(price)!
                                
                                kill = item.place
                                for num in killed {
                                    if kill > num {
                                        kill -= 1
                                    }
                                }
                                killed.append(kill)
                                orderedItems.remove(at: kill)
                            }) {
                                Image(systemName: "minus.circle.fill")
                            }
                        }
                    }
                    .navigationTitle("Order")
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 50)
                            .foregroundColor(.red)
                        Text("$" + String(sum))
                            .font(.system(size: 45))
                            .bold()
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }
        .onDisappear(perform: {
            hasRun = false
        })
        
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
