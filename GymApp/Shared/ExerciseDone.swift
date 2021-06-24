//
//  ExerciseDone.swift
//  GymApp
//
//  Created by Bernat Puig Font on 19/5/21.
//

import SwiftUI

struct ExerciseDone: View {
    var body: some View {
        VStack {
            Text("CONGRATULATIONS YOU HAVE FINISHED YOUR WORKOUT")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: 350,minHeight: 120)
                .background(Color.gray)
                .cornerRadius(10)
                .font(.title)
                .padding(.all)
            
            Image("finishWorkout")
                                .resizable()
                                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .aspectRatio(contentMode: .fit)
                                .padding(.all)
            NavigationLink(destination: ContentView()){
                Text("GO HOME")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 90)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            
        }.background(Image("image"))
        .edgesIgnoringSafeArea([.top])
    }
}

struct ExerciseDone_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDone()
    }
}

