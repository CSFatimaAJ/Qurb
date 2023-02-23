//
//  QurbModel.swift
//  Qurb
//
//  Created by Israa Kheder on 20/07/1444 AH.
//

import SwiftUI
import Foundation

struct question:Identifiable,Codable {
    var question: String?
    var id : Int?
}

var myQuestions : [question] = [

    question(
    question: "أشعر الأن في هذة اللحظة بـ",
    id: 0
    ),

    question(
    question: "ما هو أهم شي تركز عليه؟",
    id: 0
    ),
    
    question(
    question: "ما يجعلني قلق هو",
    id: 0
    ),
    
    question(
    question: "استمع رلصوتك الداخلي ماذا يقول",
    id: 0
    ),
    
    question(
    question: "تكلم عما تشعر به",
    id: 0
    ),
    
    question(
    question: "خذ قلم و أبدأ الكتابة",
    id: 0
    ),
    
    question(
    question: "ماذا يضفي عليك هذا الشعور",
    id: 0
    ),
    
    question(
    question: "هل تشعر بأنك أنهيت كل كلامك",
    id: 0
    ),

    question(
    question: "استرخ الان و مزق الورقة",
    id: 0
    ),
    
    question(
    question: "أشعر الأن في هذة اللحظة بـ",
    id: 0
    ),


]
