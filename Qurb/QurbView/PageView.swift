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
        VStack(spacing: 20) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .cornerRadius(30)
//               
                .padding()
            
            Text(page.name)
                .font(.custom("Rancho-Regular", size: 20))
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
