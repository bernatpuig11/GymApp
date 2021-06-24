//
//  HomeScreen.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 13/5/21.
//

import SwiftUI
import Firebase

struct HomeScreen: View {
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View{
        
        NavigationView{
            
            VStack{
                
               
                    ZStack{
                        
                        NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                            
                            Text("")
                        }
                        .hidden()
                        
                        LoginRegistrationView(show: self.$show)
                        
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    
}
