//
//  TextEditorView.swift
//  Qurb
//
//  Created by Israa Kheder on 22/07/1444 AH.
//

import SwiftUI
import UIKit
struct TextEditorView: View {
    
    @State private var text = ""
    
    var body: some View {
        
        VStack{
            CustomTextEditor.init(placeholder: "مساحة أمان.. لن يتم حفظ بياناتك", text: $text)
        }
    }
}
struct CustomTextEditor: View {
    
    let placeholder: String
    @Binding var text: String
    
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            TextEditor(text: $text)
                .foregroundColor(Color("BG")).font(.custom("HSN Sara", size: 12))
                .frame(width: 332, height: 273).cornerRadius(8)
                .disableAutocorrection(true)
                .lineSpacing(5)
            
            if text.isEmpty{
                
                
                Text(placeholder).foregroundColor(Color("BG")).font(.custom("HSN Sara", size: 12))
                    .frame(width: 332)
                    
            }
        }
        .onAppear(){
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear(){
            UITextView.appearance().backgroundColor = nil
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
