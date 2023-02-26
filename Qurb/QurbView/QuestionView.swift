//
//  QuestionView.swift
//  Qurb
//
//  Created by Israa Kheder on 22/07/1444 AH.
//

import SwiftUI

extension View {
    
    func dismisskeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct QuestionView: View {
    
    var catogray: Category?
    var questionCount:Int = 0
    var width: CGFloat = 128
    var height: CGFloat = 50
    var width1: CGFloat = 252
    var height1: CGFloat = 15
    var width2: CGFloat = 252
    var height2: CGFloat = 9
    @State var i : Int = 0
    @State var progressPercentage: Double = 0.0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    


    
    var body: some View {
        NavigationView{
            ZStack {
                Color("BG").ignoresSafeArea(.all)
                Image("TC").resizable().ignoresSafeArea(.all)
                VStack{
                    
                    // for playing questions
                    if(self.i < questionCount){
                        
                        Text("Step after step make you closer to yourself").foregroundColor(Color("OT")).font(.custom("Rancho-Regular", size: 22))
                            .padding(.top, 130)
                        
                        lineProgress
                        
                        // text of questions
                        Text(catogray?.question[self.i].question ?? "test").foregroundColor(Color("OT")).font(.custom("Rancho-Regular", size: 30))
                            .multilineTextAlignment(.leading)
                            .padding(.top, 80)
                            .padding(.leading, 30)
                        
                        TextEditorView()
                            .padding(.bottom,97)
                        
                        Button(action: {
                            
                            self.buttonAction(n : 0)
                            guard progressPercentage < 100 else { return }
                            progressPercentage += 8
                        }, label: {
                            Text("Next").font(.custom("Rancho-Regular", size: 25))
                                .padding(19.0)
                                .frame(width: width, height: height).cornerRadius(15)
                                .foregroundColor(Color("BT"))
                                .background(RoundedRectangle(cornerRadius: 15))
                                .foregroundColor(Color("OT"))
                        })
                        .padding(.bottom,80)
                        .padding(.leading, 200)
                        
                    }
                    
                    else{
                        RatingView(categoryID:self.catogray?.id)
                        //        NavigationLink(destination:RatingView(categoryID:self.catogray?.id).navigationBarBackButtonHidden(true)) {
                        //          RatingView()
                        //    }.navigationBarBackButtonHidden(true)
                    }
                }
            }
        } .onTapGesture {
            self.dismisskeyboard()
            
        }
        
    }
    
        var lineProgress: some View {
            
            GeometryReader { geoReader in
                
                ZStack(alignment: .leading){
                    
                    RoundedRectangle(cornerRadius: 7 , style: .continuous)
                        .strokeBorder(Color("PB"), lineWidth:1)
                        .frame(width: width1, height: height1).foregroundColor(Color("PB"))
                        .padding(.leading,75)
                    
                    RoundedRectangle(cornerRadius: 4 , style: .continuous)
                        .padding(.leading, 3.0)
                        .foregroundColor(Color("PB"))
                        .frame(width: getProgressGradientWidth(progress: CGFloat(progressPercentage), totalWidth: geoReader.size.width), height: height2)
                        .padding(.leading,75)
                    
                        .animation(.spring())
                    
                }
            }
        }
    
        
        func getProgressGradientWidth(progress: CGFloat, totalWidth: CGFloat) -> CGFloat {
            progress * totalWidth / 124
        }
        
        
        func buttonAction(n : Int ){
            if(myQuestions[self.i].id == n){
                self.i = self.i + 1
            }
        }
    }



struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
            QuestionView()
        
    }
}
