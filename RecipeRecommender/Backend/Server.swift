//
//  Server.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 9/4/23.
//

import Foundation

let recipesURL = URL(string: "https://recipes.outpond.com/api/getAllRecipes")!

let getAllRecipesTask = URLSession.shared.dataTask(with: recipesURL) { data, response, error in
    print("this is data", data)
    if let data = data {
        print(data)
//            let image = UIImage(data: data)
    } else if let error = error {
        print("HTTP Request Failed \(error)")
    }
}

class Server: ObservableObject {
    
    func getAllRecipes() {
        print("starting get all recipes")
        getAllRecipesTask.resume()
        
    }
    
}
