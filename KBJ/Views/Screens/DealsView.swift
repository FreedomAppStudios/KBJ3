//
//  DealsView.swift
//  KBJ
//
//  Created by Other user on 6/13/21.
//

import SwiftUI

struct DealsView: View {
    @State private var angle: Double = 0
    @State private var zoom: Double = 0
    var body: some View {
        ZStack {
            Color(.systemRed)
                .ignoresSafeArea(edges: .top)
            VStack {
                Spacer()
                Image("25%")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250) //250
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .onAppear(perform: {
                        if zoom < 1 {
                            angle += 360
                            zoom += 1
                        }
                        
                    })
                    .onDisappear(perform: {
                        zoom = 0
                    })
                    .scaleEffect(zoom)
                    .animation(.easeIn)
//                    .rotationEffect(.degrees(angle))
//                    .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 2, initialVelocity: 2))
                Text("25% off your entire meal!")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("Show this to your server at the end of the meal")
                    .foregroundColor(.white)
                    .font(.caption)
                Spacer()
                Spacer()
            }
        }
    }
}

struct DealsView_Previews: PreviewProvider {
    static var previews: some View {
        DealsView()
    }
}
