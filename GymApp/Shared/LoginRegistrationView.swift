//
//  LoginRegistrationView.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 12/5/21.
//

import SwiftUI
import Firebase
struct LoginRegistrationView: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    @State var  success = ""
    
    var body: some View{
        
        ZStack{
            
            ZStack(alignment: .topTrailing) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        Image("Logo")
                        
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            
                            VStack{
                                
                                if self.visible{
                                    
                                    TextField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                                else{
                                    
                                    SecureField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                self.visible.toggle()
                                
                            }) {
                                
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        
                        Button(action: {
                            
                            self.verify()
                            
                        
                            
                        }) {
                            if self.success == "Done"{
                                NavigationLink( destination: ContentView()){
                                    
                                    
                                    Text("Log in")
                                        .padding(.vertical)
                                        .background(Color("Color"))
                                        .cornerRadius(10)
                                   
                                }
                                
                                
                                
                            }else{
                                Text(self.success)
                                Text("Click twice")
                            }
                        }
                        
                    }
                    .padding(.horizontal, 25)
                }
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    NavigationLink(destination:SignUp(show: $show)){
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding()
            }
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    func verify() {
        
        if self.email != "" && self.pass != ""{
            
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                
                if err != nil{
                    print("We are here")
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                    
                }
                self.success = "Done"
                
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
        else{
            
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
            self.success = "Not yet"
        }
        
        
    }
    
}//END
