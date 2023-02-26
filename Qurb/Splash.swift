//
//  Splash.swift
//  Qurb
//
//  Created by Maryam on 23/07/1444 AH.
//
import SwiftUI

struct Splash: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    // Customise your SplashScreen here
    var body: some View {
        ZStack{
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                if isActive {
                    OnBoardingView()
                } else {
                    VStack {
                        VStack {
                            Image("s")
                                .resizable()
                                .ignoresSafeArea()
                            //
                        }
                        
                        .scaledToFit()
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.0)) {
                                self.size = 0.9
                                self.opacity = 1.00
                            }
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}
struct Splash_Previews: PreviewProvider {
static var previews: some View {
Splash()
}
}
