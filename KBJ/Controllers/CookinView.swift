//
//  CookinView.swift
//  KBJ
//
//  Created by Nick Morris on 8/19/21.
//

import SwiftUI

struct CookinView: View {
    
    var body: some View {
        NavigationView{
            List{
                dealCell(deal: "Martini Monday", description: "$5 Specialty Martinis!")
                dealCell(deal: "$2 Rib Tuesday", description: "Smoked in house; Sold by the bone until gone!")
                dealCell(deal: "Happy Hour", description: "Monday – Friday 2-7pm")
                dealCell(deal: "Burger Bar", description: "Let us cater your next event, office lunch or family dinner! ")
                dealCell(deal: "Burger Kits", description: " Cook your own Kenny’s burgers at the house! Perfect for holiday parties & cookouts. Includes everything you need to build your own burgers.")
                dealCell(deal: "Monthly Special", description: "Check back here to see what is new each month at KBJ!")
                dealCell(deal: "Stay Posted", description: "Text BURGER to 77513 to join our Text Club and see what’s cookin’ at Kenny’s!")
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .listStyle(DefaultListStyle())
            
            .navigationBarTitle("What's Cooking?")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
}

struct CookinView_Previews: PreviewProvider {
    static var previews: some View {
        CookinView()
    }
}

struct dealCell: View {
    
    let deal: String
    let description: String
    //let time: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.newRed]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 155)
                .overlay(HStack {
                    VStack{
                        HStack{
                            Text(deal)
                                .foregroundColor(Color.black)
                                .font(.title)
                                .bold()
                                .padding(.leading)
                            
                            Spacer()
                        }
                        HStack {
                            Text(description)
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                            //                                    Text(" - ")
                            //                                        .foregroundColor(Color.white)
                        }
                        //                                HStack {
                        //                                    Text(time)
                        //                                        .foregroundColor(Color.white)
                        //                                        .padding(.leading)
                        //                                    Spacer()
                        //                                }
                        
                    }
                })
                .padding()
                .frame(maxWidth: 550)
        }
    }
}
