//
//  ContentView.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 6/27/23.
//

import SwiftUI
import Auth0

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

class UserInformation: ObservableObject {
    @Published var user: User?
}


struct ContentView: View {
    
    @StateObject var userClass: UserInformation

//    @State var user: User? {
//        didSet {
//            updateUserInfo()
//        }
//    }

    var body: some View {

        if let user = userClass.user {
        
            VStack(spacing: 0) {
                
                // red header with app name text, takes up the top section only
                
                ZStack{
//                    Color("redcolor").ignoresSafeArea()
                    HStack {
                        
                        Text("Recipe Recommender").foregroundColor(Color.black)
                            .padding(.leading).font(.system(size:24))

                        Spacer()

                    }
                }
                
                .padding(0.0)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/20)
                
                // main body, a TabView that allows access between different pages
             
                TabView {
                    Group {
                        
                        // link to home page
                        RecommendationsView()
                            .padding(0.0)
                            .tabItem() {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        // link to all recipes page
                        AllRecipesView()
                            .tabItem() {
                                Image(systemName: "list.clipboard")
                                Text("Recipes")
                            }
                        
                        // link to fridge page with ingredients
                        FridgeView()
                            .tabItem() {
                                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                                Text("Fridge")
                            }
                        
 //                        link to edit page to add ingredients
                        
                        ScanAddView()
                            .tabItem() {
                                Image(systemName: "plus")
                                Text("Add")
                                
                            }
                    }
                    
                }
            }
            
        } else {
            VStack {
                Button("Login", action: self.login)
            }
        }

    }
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color(.white)) // custom color.
    }
    
//    private func updateUserInfo() {
//        Server.shared.updateUserInfoAndInitialRun(user: user!)
//    }
    
}

extension ContentView {
    func login() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    userClass.user = User(from: credentials.idToken)
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }

    func logout() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    userClass.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
