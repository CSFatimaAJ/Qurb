//
//  HomePage.swift
//  Qurb
//
//  Created by Maryam on 23/07/1444 AH.
//

import SwiftUI
struct HomePage: View {

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @ObservedObject var viewModel = HomePageViewModel() // (2)
    @StateObject var categories = HomePageViewModel() // (2)
    @State var isLoading:Bool = true
    var body: some View {
       
        NavigationView{
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                Image("b2")
                    .resizable()
                    .ignoresSafeArea()

                VStack(alignment: .leading){
                    VStack(alignment:.leading){
                        Text("Hello ..")
                            .foregroundColor(Color.white)
                            .font(.custom("Rancho-Regular", size: 35))
                        //    .multilineTextAlignment(.trailing)
                            .bold()
                        Text("How are you today?")
                            .foregroundColor(Color.white)
                            .font(.custom("Rancho-Regular", size: 35))
                            //.multilineTextAlignment(.trailing)
                            .bold()
                        
                    }.padding(.leading,28)

//
                    //        ScrollView {
                    LazyVGrid(columns: columns, spacing: 25) {

                        ForEach(0..<4) { i in
                            NavigationLink {
                                Start(catogray: self.categories.categories?[i] ).navigationBarBackButtonHidden(true)
                            }
                        label: {
                            Text(self.categories.categories?[i]?.name ?? "")
                                .foregroundColor(Color(red: 0.384, green: 0.251, blue: 0.463))
                                .font(.custom("Rancho-Regular", size: 30))
                                .frame(width: 130,height: 120)
                                .bold()
                                .padding()
                        }.navigationBarBackButtonHidden(true)
                            
                            
                            
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.black.opacity(0.2), radius: 10 , y: 5)
                        
                        
                    }
                    
                    //        }
                    .frame(maxHeight: 500)
                }
                if isLoading {
                    spinner()
                }

            }.onReceive(categories.$responseStatue, perform: { res in
                if res {
                    self.isLoading = false
                }
                
            })
            .onAppear {
                self.fetch()
             
            }
        }
            
    }
    func fetch(){
        categories.fetchCategory()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
