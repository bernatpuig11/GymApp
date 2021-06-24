//
//  StartFromListView.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 17/5/21.
//

import SwiftUI

struct StartFromListView: View {
    let exercise: Exercise
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        
        VStack(alignment: .center) {
            
            Text(exercise.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
                .padding(.bottom, 60.0)
            
            Image(exercise.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
                .padding(.bottom, 60.0)
       
            
            
            ZStack{
                
              
                
                
                VStack{
                    
                    ZStack{
                        
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                            .frame(width: 180, height: 180)
                        
                        Circle()
                            .trim(from: 0, to: self.to)
                            .stroke(Color.purple, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                            .frame(width: 180, height: 180)
                            .rotationEffect(.init(degrees: -90))
                        
                        
                        VStack{
                            
                            Text("\(self.count)")
                                .font(.system(size: 65))
                                .fontWeight(.bold)
                            
                            Text("Of 30")
                                .font(.title)
                                .padding(.top)
                        }
                    }
                    
                    HStack(spacing: 20){
                        
                        Button(action: {
                            
                            if self.count == 15{
                                
                                self.count = 0
                                withAnimation(.default){
                                    
                                    self.to = 0
                                }
                            }
                            self.start.toggle()
                            
                        }) {
                            
                            HStack(spacing: 15){
                                
                                Image(systemName: self.start ? "pause.fill" : "play.fill")
                                    .foregroundColor(.white)
                                
                                Text(self.start ? "Pause" : "Play")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                            .background(Color.purple)
                            .clipShape(Capsule())
                            .shadow(radius: 6)
                        }
                        
                        Button(action: {
                            
                            self.count = 0
                            
                            withAnimation(.default){
                                
                                self.to = 0
                            }
                            
                        }) {
                            
                            HStack(){
                                
                              
                                Text("Restart")
                                    .foregroundColor(.purple)
                                
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                            .background(
                                
                                Capsule()
                                    .stroke(Color.purple, lineWidth: 2)
                            )
                            .shadow(radius: 6)
                        }
                    }
                    .padding(.top, 55)
                }
                
            }
            .onReceive(self.time) { (_) in
                
                if self.start{
                    
                    if self.count != 30{
                        
                        self.count += 1
                                                
                        withAnimation(.default){
                            
                            self.to = CGFloat(self.count) / 30
                        }
                    }
                    else{
                        
                        print("Not working")
                        
                    }
                    
                }
                
            }
        }
    }
    
   
}
