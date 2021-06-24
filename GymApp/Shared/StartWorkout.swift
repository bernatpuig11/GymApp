//
//  StartWorkout.swift
//  GymApp
//
//  Created by Bernat Puig Font on 20/4/21.
//

import SwiftUI
import FirebaseDatabase

struct StartWorkout: View {
    @State var level: String
    @State var minutes: Int
    
    @State var exercises: [String] = []
    
    
    var body: some View {
        VStack {
            Text("START WORKOUT")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 300,minHeight: 90)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            
            
            Spacer().frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                NavigationLink(destination: ExerciseWorkout(exercises: exercises)){
                        let _ = print("Exercises \(exercises)")
                        Image(systemName: "arrow.right")
                                .resizable()
                                .frame(width: 40, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .aspectRatio(contentMode: .fit)
                                .padding(.all)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                }
            }
        }.background(Image("image"))
        .edgesIgnoringSafeArea([.top])
        .onAppear(){fetch()}
    }
    
    private func fetch(){
        let _ = print("Level \(level) and minutes \(minutes)")
        if level == "Easy" && minutes == 20 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Squats", "Side planks", "Glute bridge", "Arm circles"]
        }
        else if level == "Easy" && minutes == 30 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Squats", "Side planks", "Glute bridge", "Arm circles", "Mountain climber", "Plank", "Wall sit"]
        }
        else if level == "Easy" && minutes == 40 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Squats", "Side planks", "Glute bridge", "Arm circles", "Mountain climber", "Plank", "Wall sit", "Single-leg deadlift", "Single-leg deadlift weight", "Calf raise"]
        }
        else if level == "Easy" && minutes == 50 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Squats", "Side planks", "Glute bridge", "Arm circles", "Mountain climber", "Plank", "Wall sit", "Single-leg deadlift", "Single-leg deadlift weight", "Calf raise", "Contralateral limb raise", "Diamond push-up", "L seat"]
        }
        else if level == "Medium" && minutes == 20 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout"]
        }
        else if level == "Medium" && minutes == 30 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout", "Plank to Push-up", "Wall sit", "Heavy wall sit"]
        }
        else if level == "Medium" && minutes == 40 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout", "Plank to Push-up", "Wall sit", "Heavy wall sit", "Single-leg deadlift", "Single-leg deadlift weight", "Calf raise"]
        }
        else if level == "Medium" && minutes == 50 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout", "Plank to Push-up", "Wall sit", "Heavy wall sit", "Single-leg deadlift", "Single-leg deadlift weight", "Calf raise", "Contralateral limb raise", "Diamond push-up", "L seat"]
        }
        else if level == "Hard" && minutes == 20 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout"]
        }
        else if level == "Hard" && minutes == 30 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout", "Plank to Push-up", "Heavy wall sit","Arm circles"]
        }
        else if level == "Hard" && minutes == 40 {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout", "Plank to Push-up", "Heavy wall sit","Arm circles", "Single wall sit", "Pistol squat", "Diamond push-up"]
        }
        else {
            self.exercises = ["Lunges", "Pushups", "Burpees", "Side planks", "Glute bridge", "Mountain climber", "Prone walkout", "Plank to Push-up", "Heavy wall sit","Arm circles", "Single wall sit", "Pistol squat", "Diamond push-up", "L seat",  "Contralateral limb raise", "Wall sit"]
        }
    }
}

struct StartWorkout_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkout(level:"", minutes:0)
    }
}
