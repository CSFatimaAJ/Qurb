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
            CustomTextEditor.init(placeholder: "Safe Space .. wont store your data ", text: $text)
        }
    }
}
struct CustomTextEditor: View {
    
    let placeholder: String
    @Binding var text: String
    
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            TextEditor(text: $text)
                .foregroundColor(Color("BG")).font(.custom("Rancho-Regular", size: 20))
                .frame(width: 332, height: 273)
                .cornerRadius(8)
                .disableAutocorrection(true)
                .lineSpacing(5)
                .scrollContentBackground(.hidden)
                .background(Color("OT"))
            
            
            if text.isEmpty{
                
                
                Text(placeholder).foregroundColor(Color("BG")).font(.custom("Rancho-Regular", size: 18))
                    .padding(.trailing, 100.0)
                    .padding(.top, 12)
                    .frame(width: 332)
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                    
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
