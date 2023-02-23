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
              Text("تخطي")
                    .foregroundColor(.white)
                    .padding(.trailing, 290)
                    .font(.custom("HSN Sara", size: 20))
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
if selectedPage == 4{
NextPage = true
}

            })
            {
              Text("التالي")
                    .font(.custom("HSN Sara", size: 25))
                    .foregroundColor(Color(red: 0.384, green: 0.251, blue: 0.463))
                    .multilineTextAlignment(.center)
// .padding(.trailing, 200)
.frame(width:180, height: 60)
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
