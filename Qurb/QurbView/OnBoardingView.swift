//
//  ContentView.swift
//  te9
//
//  Created by Maryam on 29/07/1444 AH.
//

import SwiftUI
struct OnBoardingView: View {
    
    @State var selectedPage = 0
    @State var NextPage = false
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action : {
                    NextPage.toggle()
                })
                {
                    Text("Skip")
                        .foregroundColor(.white)
                        .padding(.leading, 290)
                        .font(.custom("Rancho-Regular", size: 24))
                    // .padding(.leading, 291.0)
                    //
                }
                TabView(selection: $selectedPage)
                {
                    ForEach(0..<samplePages.count){
                        index in PageView(page : samplePages[index]).tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                Spacer(minLength: 30)
                //button
                Button(action : {
                    selectedPage += 1
                    if selectedPage == 3{
                        NextPage = true
                    }
                    
                })
                {
                    Text("Next")
                        .font(.custom("Rancho-Regular", size: 25))
                        .foregroundColor(Color(red: 0.384, green: 0.251, blue: 0.463))
                        .multilineTextAlignment(.center)
                    // .padding(.trailing, 200)
                        .frame(width:100, height: 44)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                Spacer(minLength: 50)
                
            }
        }.fullScreenCover(isPresented: $NextPage) {
            HomePage()
        }
    }
    //
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
