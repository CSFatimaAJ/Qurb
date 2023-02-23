//
//  category.swift
//  Qurb
//
//  Created by Fatima Aljaber on 22/02/2023.
//

import Foundation

//struct category:Identifiable, Codable{
//
//    let id :String?
//    let name: String?
//    let Rate:String?
//    let question : [question]?
//
//}
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct cateogriesArray: Codable {
    let category: [Category?]

    enum CodingKeys: String, CodingKey {
        case category = "Category"
    }
}

// MARK: - Category
struct Category: Codable {
    let id, name: String
    let question: [Question]

    enum CodingKeys: String, CodingKey {
        case id, name, question
    }
}

// MARK: - Question
struct Question: Codable {
    let id: Int
    let question: String
}



//let catograies = ["حزين" , "مكتئب", "مضطرب", "قلق"]

