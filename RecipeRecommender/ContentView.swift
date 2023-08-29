//
//  ContentView.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 6/27/23.
//

import SwiftUI
import Auth0


struct ContentView: View {

    @State var user: User?

    var body: some View {

        if let user = self.user {

            VStack {
                Button("Logout", action: self.logout)
//                TabView {
//                    Recommendations()
//                        .tabItem() {
//                            Image(systemName: "house")
//                            Text("Home")
//                        }
//
//                }

                Text(user.name)
                Text(user.id)
                Text(user.email)

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
}

extension ContentView {
    func login() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    self.user = User(from: credentials.idToken)
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
                    self.user = nil
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
