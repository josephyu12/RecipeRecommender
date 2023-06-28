//
//  ContentView.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Recommendations()
                .tabItem() {
                    Image(systemName: "house")
                    Text("Home")
                }
            
        }
        
    }
       init() {
           UITabBar.appearance().barTintColor = UIColor(Color(.white)) // custom color.
           
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
