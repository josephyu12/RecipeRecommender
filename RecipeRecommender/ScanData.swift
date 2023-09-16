//
//  ScanData.swift
//  RecipeRecommender
//
//  Created by Travis Tran on 9/4/23.
//

import Foundation


struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
