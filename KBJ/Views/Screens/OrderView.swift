//
//  OrderView.swift
//  KBJ
//
//  Created by Nick Morris on 6/18/21.
//

import SwiftUI
var itemNumber = 0
struct OrderView: View {
    @State var orderedItems = [Order]()
    @State var kill = 0
    @State var killed = [Int]()
    @State var hasRun = false
    @State var refreshed = false
    @State var sum = 0.0
    @State var cookMessage = "R"
    let degreesOfDoneness = ["R", "MR", "M", "MW", "WD",""]
    @State var allTemps = [Int]()
    @State var rotate = 0
    @State var new = 0
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
                                sum = 0
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
                                .font(.title2)
                                .onAppear(perform: {
                                    orderedItems.append(contentsOf: foodOrdered)
                                    foodOrdered = []
                                })
                            Spacer()
                            Button (cookMessage) {
                                
                                @State var num = 0
                                @State var row = 0
                                row = 7
                                for x in orderedItems {
                                    let isEqual = x.foodName == item.foodName
                                    row = 6
                                    if isEqual == true{
                                        row = 5//num
                                    }
                                    num += 1
                                }
                                print(item.type)
//                                if item.type == "burger" {
                                    let current = allTemps[row]

                                    if current  > 4 {
                                        new = current + 1
                                    } else {
                                        new = 0
                                    }
                                    allTemps[row] = new

                                    //                                    if rotate < (degreesOfDoneness.count - 1) {
                                    //                                        rotate += 1
                                    //                                    } else {
                                    //                                        rotate = 0
                                    //                                    }
                                    cookMessage = String(row)//String(row)//degreesOfDoneness[allTemps[row]]
//                                }
                            }
                            .onAppear {
                                allTemps.append(1)
                                
                            }
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
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .navigationTitle("Order")
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 50)
                            .foregroundColor(.red)
                        Text("$" + String(sum.truncate(places: 2)))
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
extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
//struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection {
//    typealias Index = Base.Index
//    typealias Element = (index: Index, element: Base.Element)
//
//    let base: Base
//
//    var startIndex: Index { base.startIndex }
//
//    // corrected typo: base.endIndex, instead of base.startIndex
//    var endIndex: Index { base.endIndex }
//
//    func index(after i: Index) -> Index {
//        base.index(after: i)
//    }
//
//    func index(before i: Index) -> Index {
//        base.index(before: i)
//    }
//
//    func index(_ i: Index, offsetBy distance: Int) -> Index {
//        base.index(i, offsetBy: distance)
//    }
//
//    subscript(position: Index) -> Element {
//        (index: position, element: base[position])
//    }
//}
