//
//  Structs.swift
//  RecipeRecommender
//
//  Created by Joseph Yu on 9/12/23.
//

import Foundation

struct Recipe: Identifiable, Codable {
    var id: Int
    var name: String
    var url: String?
    var category: String?
    var author: String?
    var summary: String?
    var rating: String?
    var rating_count: Int?
    var review_count: Int?
    var ingredients: String?
    var directions: String?
    var prep: String?
    var cook: String?
    var total: String?
    var servings: Int?
    var yield: String?
    var calories: String?
    var carbohydrates_g: String?
    var sugars_g: String?
    var fat_g: String?
}
