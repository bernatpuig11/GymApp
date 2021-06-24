//
//  ContentView.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 31/3/21.
//

import SwiftUI
import Firebase
import AVKit
struct ContentView : View {
    @State var show = false
    @State var alert = false
    var body: some View {
        
       
            
            VStack {
                
                   
           Spacer()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("PERSONAL FITNESS APP")
                          .font(.largeTitle)
                          .fontWeight(.bold)
                              .multilineTextAlignment(.center)
          
                    
                
                                .padding()
                NavigationLink(destination: LevelsView()){
                           Text("START")
                               .bold()
                               .font(.title)
                               .padding(.all)
                            .foregroundColor(.black)
                }
              
                NavigationLink(destination:ExercisesListView()) {
                    Text("List of Exercises")
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .clipShape(Rectangle())
                }
            
                Spacer()
                    Button(action: {
                        
                        try! Auth.auth().signOut()
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                        
                    }) {
                        NavigationLink(destination:LoginRegistrationView(show: $show)){
                        Text("Log out")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                    }
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                
            }.background(Image("image"))
            .scaledToFill()
            //.clipped()
            .edgesIgnoringSafeArea([.top])
            
            .navigationBarBackButtonHidden(true)

            // A UIImageView with async loading
         
               

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

