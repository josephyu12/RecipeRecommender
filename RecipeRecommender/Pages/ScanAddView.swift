//
//  ScanAddView.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 9/25/23.
//

import SwiftUI

struct ScanAddView: View {
    
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    
    var body: some View {
        
        
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
        
        
        
    }
    
    private func makeScannerView()-> Scanner {
            Scanner(completion: {
                textPerPage in
                if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                    let newScanData = ScanData(content: outputText)
                    self.texts.append(newScanData)
                }
                self.showScannerSheet = false
            })
        }
}

#Preview {
    ScanAddView()
}
