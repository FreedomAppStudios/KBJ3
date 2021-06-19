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
                        Button (action:{
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
