//
//  AllRecipes.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 9/4/23.
//

import SwiftUI

struct AllRecipesView: View {
    
    @ObservedObject var server = Server()
    
    var body: some View {
        VStack {
            HStack{
                Text("All Recipes")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .fontWeight(.bold)
                Image(systemName: "gear")
                    .padding(.trailing)
                    .fontWeight(.bold)
            }
            
            ScrollView {
                
                ForEach(server.allRecipes) {item in
                    
                                    HStack {
                    
                                        Text(item.name)
                                                .font(.title3)
                                                .multilineTextAlignment(.leading)
                    
                                            Spacer()
                    
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 15, style: .circular)
                                                .frame(width: 30, height: 55)
                                                .foregroundColor(.white)
                    
                                            VStack {
                                                Text("10")
                                                    .font(.subheadline)
                    
                                                Image(systemName: "circle.fill")
                                                    .foregroundColor(.green)
                    
                                            }
                    
                                        }
                    
                                    }
                                    .padding(.vertical, -8.0)
                                    .padding()
                                    .background(Rectangle().foregroundColor(Color("light-gray"))
                                        .cornerRadius(15))
                                    .padding()
                    
                }
                
//                HStack {
//
//                        Text("Creamy Chicken Alfredo Pasta")
//                            .font(.title3)
//                            .multilineTextAlignment(.leading)
//
//                        Spacer()
//
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 15, style: .circular)
//                            .frame(width: 30, height: 55)
//                            .foregroundColor(.white)
//
//                        VStack {
//                            Text("10")
//                                .font(.subheadline)
//
//                            Image(systemName: "circle.fill")
//                                .foregroundColor(.green)
//
//                        }
//
//                    }
//
//                }
//                .padding(.vertical, -8.0)
//                .padding()
//                .background(Rectangle().foregroundColor(Color("light-gray"))
//                    .cornerRadius(15))
//                .padding()
//
//                HStack {
//
//                        Text("Creamy Chicken Alfredo Pasta")
//                            .font(.title3)
//                            .multilineTextAlignment(.leading)
//
//                        Spacer()
//
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 15, style: .circular)
//                            .frame(width: 30, height: 55)
//                            .foregroundColor(.white)
//
//                        VStack {
//                            Text("10")
//                                .font(.subheadline)
//
//                            Image(systemName: "circle.fill")
//                                .foregroundColor(.green)
//
//                        }
//
//                    }
//
//                }
//                .padding(.vertical, -8.0)
//                .padding()
//                .background(Rectangle().foregroundColor(Color("light-gray"))
//                    .cornerRadius(15))
//                .padding()
                
            }.shadow(radius: 15)
        }
    }
    init() {
        server.getAllRecipes()
    }
}

struct AllRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipesView()
    }
}
