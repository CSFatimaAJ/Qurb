//
//  RatingView.swift
//  Qurb
//
//  Created by Fatima Aljaber on 15/02/2023.
//

import SwiftUI


struct RatingView: View {
    
    let Ratingcolumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @State var level : Int = 0
    var RatingData = RatingModel()
    var Thankyou = "شكرا لك لمشاركتك"
    var categoryID:String?
    @State var pressed : Bool = true
    @State var ispresented = false
    @State var isAlerted = false
    @State var Note: String = "ملاحظاتك تسعدنا ...."
    @State var ratingState : RatingLevels = .happy
    @ObservedObject var viewModel = RatingViewModel() // (2)

    var body: some View {
     
        ZStack {
            NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true), isActive: $isAlerted){
                HomePage()}.navigationBarBackButtonHidden(true)
            Color("background").edgesIgnoringSafeArea(.all)
            Image("b2")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 25){
                VStack(alignment: .center, spacing: -5){
                    Text("وخلصت الرحله")
                    Text("خد نفس عميق واشكر نفسك")
                    Text("وقلنا")
                }
                .foregroundColor(Color.white)
                    .font(.custom("HSN Sara", size: 24))
                    .multilineTextAlignment(.center)
                    .bold()
                VStack{
                    Text("كيف حالك الان ؟").foregroundColor(Color.white)
                        .font(.custom("HSN Sara", size: 24))
                        .multilineTextAlignment(.center)
                        .bold()
            
                    LazyVGrid(columns: Ratingcolumns) {
                        ForEach (RatingData.getRatingLevels().indices, id: \.self) { i in

                            let Level = RatingData.getRatingLevels()
                            if pressed && self.level == i {
                                Qurb.filled(filled: .white, ratingState: RatingData.Filled(pressed: !pressed, Rating: Level[i].rawValue)).onTapGesture {
                                    self.ratingState = Level[i]
                                    self.level = i
                                    pressed.toggle()
                                    
                                }
                            }
                            else{
                                if !pressed {
                                Qurb.filled(filled: .clear, ratingState: RatingData.Filled(pressed: !pressed, Rating: Level[i].rawValue))
                                        .onTapGesture{
                                            self.level = i
                                            self.ratingState =   Level[i]
                                            pressed.toggle()
                                        }
                                }
                                else{
                                    Qurb.filled(filled: .clear, ratingState: RatingData.Filled(pressed: pressed, Rating: Level[i].rawValue))
                                            .onTapGesture{
                                                self.ratingState = Level[i]
                                                self.level = i
                                                pressed.toggle()
                                            }
                                }
                            }
                        }

                    }.frame(width: 260)
                    
                    TextEditor(text: $Note)
                        .textFieldStyle(.roundedBorder)
                        .font(.custom("HSN Sara", size: 15))
                        .lineLimit(5, reservesSpace: true)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 350, height:120)
                        .padding(.top)
                        .foregroundColor(Color("BG"))
                        .scrollContentBackground(.hidden)
                        .background(Color("OT"))
                        
                        .onChange(of: Note) { note in
                            self.Note = note
                        }
                    Button("تم") {
                        viewModel.addRate(Rate: self.ratingState.rawValue, Note: self.Note, CategoreID: self.categoryID)
                    }.onReceive(viewModel.$responseStatue, perform: { res in
                        if res {
                            self.ispresented = res
                        }
                    }).alert(self.Thankyou,isPresented: $ispresented) {
                        Button {
                            self.isAlerted = true
                          } label: {
                              Text("اقرب لذاتك")
                                  .bold()
                                  .foregroundColor(Color("background"))
                          }
                          .foregroundColor(Color("background"))
                    } message: {
                          Text(viewModel.responseResult).font(Font.custom("HSN Sara", size: 24))
                            .foregroundColor(Color("background"))
                      }

                    .font(Font.custom("HSN Sara", size: 24)).foregroundColor(Color("background")).background(
                        Rectangle()
                            .frame(width: 128, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        )
                        
                    
                }
                
            }
        }
    }
    
   
}

struct filled: View {
    var filled : Color = .clear
    var ratingState : String?
    var body: some View {
        VStack{
            ZStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 5)
                        .fill(filled)
                        .frame(width: 65, height: 65)
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 5)
                        .strokeBorder(.white,lineWidth: 3)
                        .frame(width: 65, height: 65)
                }
                Image(ratingState ?? "").resizable().scaledToFill().frame(width: 35, height: 35, alignment:.center)
            }
            
           
        }
    }
}
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RatingView()
        }.navigationBarBackButtonHidden(true)
    }
}
