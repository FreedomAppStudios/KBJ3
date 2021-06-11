//
//  HomeView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack {
            Color(.systemRed)
                .ignoresSafeArea(edges: .top)
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                Text("Kenny's Burger Joint")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                Text("Plano")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                Spacer()
                
                Spacer()
               
                InfoView(text: "(972) 378-0999", imageName: "phone.fill")
                LinkView(text: "kennysburgerjoint.com", imageName: "globe")
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.white)
            .frame( height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.red)
                Text(text)
                    .foregroundColor(.red)
            })
            .padding()
        
    }
}
struct LinkView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        Link(destination: URL(string: "https://kennysburgerjoint.com")!,
             label: {
                HStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame( height: 50)
                        .overlay(HStack {
                            Image(systemName: imageName)
                                .foregroundColor(.red)
                            Text(text)
                                .foregroundColor(.red)
                        })
                        .padding()
                }
             })
    }
}
