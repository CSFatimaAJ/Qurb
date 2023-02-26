//
//  PageModel.swift
//  te9
//
//  Created by Maryam on 29/07/1444 AH.
//


import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    
    var imageUrl: String
    var tag: Int
}
//    var samplePage = Page(name: "Title Example", imageUrl: "m1", tag: 0)
//    var testData:[Card] = [

    var samplePages: [Page] = [
        Page(name: "Writing spaces for your emotional understanding and positivety simulating", imageUrl: "m1", tag: 0),
        Page(name: "A total privacy where you can share you feeling confidentially", imageUrl: "m2", tag: 1),
        Page(name: "Don't forget rating your experiance to maintain the quality of our service", imageUrl: "r", tag: 2),
    ]



//
//var samplePages: [Page] = [
//    Page(name: "مساحات كتابية علاجية لتفريغ المشاعر وتعزيز الطاقة الإيجابية ", imageUrl: "m1", tag: 0),
//    Page(name: " خصوصية تامة شارك مشاعرك بثقة لن يتم حفظ أي بيانات خاصة فيك", imageUrl: "m2", tag: 1),
//    Page(name: "لاتنسى تقييم مشاعرك لتتطوير والحفاظ على جودة الخدمة", imageUrl: "r", tag: 2),
//]
//
