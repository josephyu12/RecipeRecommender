//
//  Server.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 9/4/23.
//

import Foundation

class Server: ObservableObject {
    
//    @Published var globalUser = User()
    
    @Published var allRecipes = [Recipe]()
    @Published var fridgeItems = [Ingredient]()
    
    func getAllRecipes() {
        
        let recipesURL = URL(string: "https://recipes.outpond.com/api/getAllRecipes")!

        let getAllRecipesTask = URLSession.shared.dataTask(with: recipesURL) { data, response, error in
//            print("this is data", data)
            if let data = data {
                
                let jsonString = String(data: data, encoding: .utf8)
                
//                print(jsonString)
//                
//                print(data)
                
                do {
                    
                    let decoder = JSONDecoder()
                    self.allRecipes = try decoder.decode([Recipe].self, from: data)
//                    print(self.allRecipes[0])
                
                } catch {
                    print(String(describing: error))
                }
                
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        print("starting get all recipes")
        getAllRecipesTask.resume()
        
    }
    
    func getFridgeItems() {
        
        let fridgeItemsURL = URL(string: "https://recipes.outpond.com/api/getFridgeItems")!
        
        var request = URLRequest(url: fridgeItemsURL)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "username": 13,
            "name": "Jack & Jill"
        ]
//        request.httpBody = parameters.percentEncoded()

        let getFridgeItemsTask = URLSession.shared.dataTask(with: fridgeItemsURL) { data, response, error in
//            print("this is data", data)
            if let data = data {
                
                let jsonString = String(data: data, encoding: .utf8)
                
//                print(jsonString)
//
//                print(data)
                
                do {
                    
                    let decoder = JSONDecoder()
                    self.fridgeItems = try decoder.decode([Ingredient].self, from: data)
                
                } catch {
                    print(String(describing: error))
                }
                
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        print("starting get all fridge items")
        getFridgeItemsTask.resume()
        
    }
    
}
