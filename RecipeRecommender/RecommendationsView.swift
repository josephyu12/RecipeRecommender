//
//  Recommendations.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 6/27/23.
//

import SwiftUI

struct RecommendationsView: View {
    
    @ObservedObject var server = TestSQL()
    
    let image = Image("examplerecipe")
    
    var body: some View {
        VStack {
            HStack{
                Text("My Recommendations")
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
                
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .topTrailing) {
                        
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15, style: .circular)
                                .frame(width: 37, height: 65)
                                .foregroundColor(.white)
                            
                            VStack {
                                Text("10")
                                    .font(.title2)
                                
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                
                            }
                            
                        }
                        .padding([.top, .trailing], 8.0)
                        
                    }
                    
                    HStack {
                        
                        Text("Creamy Chicken Alfredo Pasta")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                    }
                    
                }
                .padding()
                .background(Rectangle().foregroundColor(Color("light-gray"))
                    .cornerRadius(15)
                    .shadow(radius: 15))
                .padding()
                
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .topTrailing) {
                        
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15, style: .circular)
                                .frame(width: 37, height: 65)
                                .foregroundColor(.white)
                            
                            VStack {
                                Text("10")
                                    .font(.title2)
                                
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                
                            }
                            
                        }
                        .padding([.top, .trailing], 8.0)
                        
                    }
                    
                    
                    
                    HStack {
                        
                        
                        
                        Text("Creamy Chicken Alfredo Pasta")
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                    }
                    
                }
                .padding()
                .background(Rectangle().foregroundColor(Color("light-gray"))
                    .cornerRadius(15)
                    .shadow(radius:15))
                .padding()
                
                
            }
        }
        
    }
    
    init() {
        server.testGetData()
    }

}

struct RecommendationsView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationsView()
    }
}
