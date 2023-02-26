//
//  RatingViewModel.swift
//  Qurb
//
//  Created by Fatima Aljaber on 16/02/2023.
//

import Foundation
import SwiftUI

import FirebaseDatabase

class RatingViewModel: ObservableObject {
    
    @Published var responseStatue: Bool = false
    @Published var responseResult: String = ""

    private lazy var databasePath: DatabaseReference? = {
          let ref = Database.database().reference()
          return ref
      }()
    
    
    func addRate(Rate:String,Note:String,CategoreID:String?) {

           let data = ["Rate":Rate,"Note":Note,"CategoreID":CategoreID]
        databasePath?.child("Rates").childByAutoId().setValue(data)
           {
             (error:Error?, ref:DatabaseReference) in
             if let error = error {
                 self.responseStatue = false
                 self.responseResult = "Data could not be saved: \(error)."
               print("Data could not be saved: \(error).")
             } else {
                 self.responseStatue = true
                 self.responseResult = "Your rating makes us happier."
               print("Data saved successfully!")
             }
           }
       
     }
    
}
