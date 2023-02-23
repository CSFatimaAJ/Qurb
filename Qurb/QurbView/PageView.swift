//
//  PageView.swift
//  te9
//
//  Created by Maryam on 29/07/1444 AH.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 10) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
//               
                .padding()
            
            Text(page.name)
                .font(.custom("HSN Sara", size: 25))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.all)
           
        }
    }
}

struct PageView_Previews1: PreviewProvider {
    static var previews: some View {
        PageView(page: samplePages[1])
    }
}
