//
//  RatingModel.swift
//  Qurb
//
//  Created by Fatima Aljaber on 15/02/2023.
//

import Foundation
import SCLAlertView
struct RatingModel{
    
    var CategoreID : String?
    var Rate : String?
    var Note : String?
    
    func getRatingLevels()->[RatingLevels]{
        let RatingLevels = [RatingLevels.happy,RatingLevels.sad,RatingLevels.cool,RatingLevels.confused]
        return RatingLevels
    }

    func Filled(pressed:Bool,Rating:String) -> String{
        switch Rating {
        case "happy":
            return pressed ? "HappyWhite" : "HappyPurple"
        case "sad":
            return pressed ? "SadWhite" : "SadPurple"
        case "cool":
            return pressed ? "CoolWhite" : "CoolPurple"
        case "confused":
            return pressed ? "ConfusedWhite" : "ConfusedPurple"
        default:
            return pressed ? "te" : "re"
        }
    }

}

enum RatingLevels: String {
    case happy = "happy"
    case sad = "sad"
    case cool = "cool"
    case confused = "confused"

}
