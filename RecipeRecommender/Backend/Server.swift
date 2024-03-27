//
//  Server.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 9/4/23.
//

import Foundation

class Server: ObservableObject {
    
    @Published var allRecipes = [Recipe]()
    @Published var fridgeItems = [Ingredient]()
    
    var userEmail = ""
    var userID = ""
    
    static let shared = Server()
    
    func updateUserInfoAndInitialRun(user: User) {
        userEmail = user.email
        userID = user.id
        getAllRecipes()
        getFridgeItems()
    }
    
    func getAllRecipes() {
        
        let recipesURL = URL(string: "https://recipes.outpond.com/api/getAllRecipes")!

        let getAllRecipesTask = URLSession.shared.dataTask(with: recipesURL) { data, response, error in
//            print("this is data", data)
            if let data = data {
                
                let jsonString = String(data: data, encoding: .utf8)
                
//                print(jsonString)

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
        
        getAllRecipesTask.resume()
        
    }
    
    
    func getFridgeItems() {
        
        let fridgeItemsURL = URL(string: "https://recipes.outpond.com/api/getFridgeItems")!
        
        var request = URLRequest(url: fridgeItemsURL)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let postString = "email=\(userEmail)&id=\(userID)"
        request.httpBody = postString.data(using: .utf8)
        let getFridgeItemsTask = URLSession.shared.dataTask(with: request) { data, response, error in

            if let data = data {
                
                let jsonString = String(data: data, encoding: .utf8)
                
                do {
                    
                    let decoder = JSONDecoder()
                    self.fridgeItems = try decoder.decode([Ingredient].self, from: data)
                    
                    for item in self.fridgeItems {
                        print("printing item")
                        print(item)
                    }
                
                } catch {
                    print(String(describing: error))
                }
                
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        getFridgeItemsTask.resume()
        
    }
    
}
