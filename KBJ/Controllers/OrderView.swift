//
//  OrderView.swift
//  KBJ
//
//  Created by Nick Morris on 6/18/21.
//

import SwiftUI
var itemNumber = 0
struct OrderView: View {
    @State var show = false
    @State var cookShow = false
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
                ZStack {
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
                                Button  {
                                    withAnimation{
                                        show.toggle()
                                    }
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(.white)
                                }
                                
                                
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
                    if self.show {
                        GeometryReader{geometry in
                            
                            Menu()
                                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        }
                        .background(Color.black.opacity(0.65))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            self.show.toggle()
                        }
                        
                    }
                    if self.cookShow {
                        GeometryReader{geometry in
                            
                            CookMenu()
                            //.position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        }
                        .background(Color.black.opacity(0.65))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            self.cookShow.toggle()
                        }
                        
                    }
                }
            }
        }
        .onDisappear(perform: {
            hasRun = false
        })
    }
    struct Menu: View {
        //        @State var show : Bool
        //        @State var cookShow : Bool
        let buttonWidth: CGFloat = 40
        let buttonHeight: CGFloat = 38
        var body: some View{
            VStack(alignment: .leading, spacing: 15 ) {
                
                Button(action: {
                    //                    OrderView.show.toggle()
                    //                    OrderView.cookShow.toggle()
                }) {
                    HStack(spacing: 12){
                        Image(systemName: "flame")
                            .foregroundColor(.white).frame(width: buttonWidth, height: buttonHeight, alignment: .leading)
                        Text("Temperture")
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                    .frame(width: 200)
                }
                .background(Color(.systemRed))
                .cornerRadius(15)
                Button(action: {
                    
                }) {
                    HStack(spacing: 12){
                        Image(systemName: "pencil.circle")
                            .foregroundColor(.white).frame(width: buttonWidth, height: buttonHeight, alignment: .leading)
                        Text("Complications")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(width: 200)
                }
                .background(Color(.systemRed))
                .cornerRadius(15)
            }
        }
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

struct CookMenu: View {
    var body: some View{
        VStack(alignment: .leading, spacing: 15 ) {
            
            //rare
            Button(action: {
                
            }) {
                HStack(spacing: 12){
                    Text("Rare")
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .frame(width: 200)
            }
            .background(Color(.systemRed))
            .cornerRadius(15)
            
            //MR
            Button(action: {
                
            }) {
                HStack(spacing: 12){
                    Text("Medium Rare")
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .frame(width: 200)
            }
            .background(Color(.systemRed))
            .cornerRadius(15)
            
            //MW
            Button(action: {
                
            }) {
                HStack(spacing: 12){
                    Text("Medium Well")
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .frame(width: 200)
            }
            .background(Color(.systemRed))
            .cornerRadius(15)
            //WD
            Button(action: {
                
            }) {
                HStack(spacing: 12){
                    Text("Well Done")
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .frame(width: 200)
            }
            .background(Color(.systemRed))
            .cornerRadius(15)
        }
        
    }
}
