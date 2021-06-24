//
//  ExercisesListView.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 8/4/21.
//

import SwiftUI
import FirebaseDatabase

struct ExercisesListView: View {
    @ObservedObject private var viewModel = ListExerciseViewModel()
    @State var searchExercise = ""
    @State private var isEditing = false
   
    //let exercise: Exercise
 
    var body: some View {
       // let _ = print("Size \(viewModel.exerc.count)")
        
        VStack{
            
            Text("LIST OF EXERCISES")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: 300,minHeight: 50)
                .background(Color.gray)
                .cornerRadius(10)
                .font(.title)
            
            HStack{
               
            
            TextField("Search ...", text: $searchExercise)
                          .padding(7)
                          .padding(.horizontal, 25)
                          .background(Color(.systemGray6))
                          .cornerRadius(8)
                          .padding(.horizontal, 10)
                        
           
                   
            }
            .overlay(
                HStack{
                    Image(systemName:"magnifyingglass")
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                }.padding(.horizontal,15)
            )
        
            
            
            List(viewModel.exerc.filter({searchExercise.isEmpty ? true :
                $0.name.contains(searchExercise)})){tip in
                
              
                VStack(alignment: .center) {
                    
                    Text(tip.name)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        .padding(.bottom, 40.0)
                    NavigationLink(destination: StartFromListView(exercise:tip)){
                        Text("Start this exercise")
                            .font(.title2)
                            .fontWeight(.black)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(minWidth: 0, maxWidth: (UIScreen.main.bounds.width),minHeight: 50)
                            .background(Color.purple)
                            .cornerRadius(22)
                            .font(.title)
                    }
                   
        
                    
                    Image(tip.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                        .padding(.bottom,40.0)
                    
                    
                    
                    Text(tip.description)
                        .font(.subheadline)
                        .lineSpacing(10.0)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                }
                .frame(height: 655.0)
                
            }
            .onAppear(){self.viewModel.fetchData()}
         
            
            
            
        }
    }
}

struct ExercisesListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ExercisesListView()
        
    }
}


//                                VideoPlayer(player: AVPlayer(url: URL(string:"https://cdn.videvo.net/videvo_files/video/free/2018-09/small_watermarked/180419_Boxing_07_04_preview.mp4")!))
//                                    .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
