//
//  HomePageViewModel.swift
//  Qurb
//
//  Created by Fatima Aljaber on 22/02/2023.
//

import Foundation
//
//  RatingViewModel.swift
//  Qurb
//
//  Created by Fatima Aljaber on 16/02/2023.
//

import Foundation
import SwiftUI
import SCLAlertView
import FirebaseDatabase
import SVProgressHUD
import UIKit
final class HomePageViewModel: ObservableObject {
    
    @Published var responseStatue: Bool = false
    @Published var categories : [Category?]?
    private lazy var databasePath: DatabaseReference? = {
          let ref = Database.database().reference()
          return ref
      }()

    func fetchCategory() {

        guard let lng = Locale.current.language.languageCode?.identifier.uppercased() else {
            return
        }
        databasePath?.child("\(lng)").observeSingleEvent(of: .value) { [weak self] (snapshot,error)  in

            guard
                var json = snapshot.value as? NSDictionary
            else {
                print("error")
                return
            }
     
            do {
                let categoriesData = try JSONSerialization.data(withJSONObject: json)
                let data = try JSONDecoder().decode(cateogriesArray.self, from: categoriesData)
                self?.categories = data.category
                self?.responseStatue = true

            } catch {
                print("an error occurred", error)
            }
            
        }
    }
    
}
