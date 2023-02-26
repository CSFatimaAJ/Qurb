//
//  Start.swift
//  Qurb
//
//  Created by Maryam on 23/07/1444 AH.
//

import SwiftUI

struct Start: View {
    var catogray: Category?
 

    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                Image("b2")
                
                    .resizable()
                    .ignoresSafeArea()
         
                VStack{
                    
//                    Spacer()
//                        .frame(height: 100)
                    Text("Relax, Have a deep breath ..")
                        .foregroundColor(Color.white)
                        .font(.custom("Rancho-Regular", size: 25))
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.horizontal)
                    Text("Then take a step for yourself with yourself")
                        .foregroundColor(Color.white)
                        .font(.custom("Rancho-Regular", size: 25))
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.all)
                    //                Button("ابدأ"){
                    //
                    //                                                           }
                    Spacer()
                        .frame(height: 30)
                    NavigationLink {
                        QuestionView(catogray: catogray,questionCount: catogray?.question.count ?? 0).navigationBarBackButtonHidden(true)

                    } label: {
                        Text("Start")
                    }.navigationBarBackButtonHidden(true)
                   
                   
                    .foregroundColor(Color(red: 0.384, green: 0.251, blue: 0.463))
                    .font(.custom("Rancho-Regular", size: 25))
                    .foregroundColor(.white)
                    .frame(width: 128,height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                    
//
                }
                
            }
        }      .navigationBarItems(
            leading:
                NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "arrow.backward.circle.fill").resizable().foregroundColor(Color.white).frame(width: 40, height: 40) // set image here
                    .aspectRatio(contentMode: .fit)
                    
                })

    }

}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
