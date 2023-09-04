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

struct ContentView: View {

    @State var user: User?
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []

    var body: some View {

        if let user = self.user {
        
            VStack(spacing: 0) {
                
                // red header with app name text, takes up the top section only
                
                ZStack{
                    Color("redcolor").ignoresSafeArea()
                    HStack {
                        
                        Text("Unified Grocery App").foregroundColor(Color.black)
                            .padding(.leading).font(.system(size:24))

                        Spacer()

                    }
                }
                .padding(0.0)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/20)
                
                // main body, a TabView that allows access between different pages
                
                
                // testing for scanner
                
                
                NavigationView{
                            VStack{
                                if texts.count > 0{
                                    List{
                                        ForEach(texts){text in
                                            NavigationLink(
                                                destination:ScrollView{Text(text.content)},
                                                label: {
                                                    Text(text.content).lineLimit(1)
                                                })
                                        }
                                    }
                                }
                                else{
                                    Text("No scan yet").font(.title)
                                }
                            }
                                .navigationTitle("Scan OCR")
                                .navigationBarItems(trailing: Button(action: {
                                    self.showScannerSheet = true
                                }, label: {
                                    Image(systemName: "doc.text.viewfinder")
                                        .font(.title)
                                })
                                .sheet(isPresented: $showScannerSheet, content: {
                                    self.makeScannerView()
                                })
                                )
                        }
                
                
                
                // testing for scanner
             
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
                        
                        // link to edit page to add ingredients
//                        ScanAddView()
//                            .tabItem() {
//                                Image(systemName: "plus")
//                                Text("Add")
//                                
//                            }
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
    
    
    private func makeScannerView()-> ScanAddView {
            ScanAddView(completion: {
                textPerPage in
                if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                    let newScanData = ScanData(content: outputText)
                    self.texts.append(newScanData)
                }
                self.showScannerSheet = false
            })
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
