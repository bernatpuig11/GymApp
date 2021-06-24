//
//  ExerciseWorkout.swift
//  GymApp
//
//  Created by Bernat Puig Font on 24/4/21.
//

import SwiftUI
import FirebaseDatabase

struct ExerciseWorkout: View {
    @State var minutes1: Int = 0
    @State var seconds1: Int = 0
    @State var minutes2: Int = 1
    @State var seconds2: Int = 0
    @State var minutes3: Int = 2
    @State var seconds3: Int = 0
    @State var timer1IsPaused: Bool = true
    @State var timer2IsPaused: Bool = true
    @State var timer3IsPaused: Bool = true
    @State var timer1: Timer? = nil
    @State var timer2: Timer? = nil
    @State var timer3: Timer? = nil
    
    @State var fetchBoolean: Bool = true
    
    @State var index: Int = 0
    
    let exercises: [String]
    
    @ObservedObject private var viewModel = ListExerciseViewModel()
    
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Spacer()
                if minutes1 < 10 && seconds1 < 10{
                    Text("0\(minutes1):0\(seconds1)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.title)
                        .padding(.all)
                }
                else if minutes1 < 10 {
                    Text("0\(minutes1):\(seconds1)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.title)
                        .padding(.all)
                }
                else if seconds1 < 10 {
                    Text("\(minutes1):0\(seconds1)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.title)
                        .padding(.all)
                }
                else  {
                    Text("\(minutes1):\(seconds1)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.title)
                        .padding(.all)
                }
                
            }.position(x: 200, y: 80)
            
            Spacer().frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            if minutes2 < 10 && seconds2 < 10{
                Text("0\(minutes2):0\(seconds2)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            else if minutes2 < 10 {
                Text("0\(minutes2):\(seconds2)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            else if seconds2 < 10 {
                Text("\(minutes2):0\(seconds2)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            else {
                Text("\(minutes2):\(seconds2)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            
            Button(action:{
                if !timer2IsPaused {
                    self.startTimer3()
                    self.stopTimer2()
                    resetTimer(x: 2)
                }
                else if timer2IsPaused && timer3IsPaused {
                    self.startTimer3()
                }
                print("START")
            }){
                Text("START")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 300,minHeight: 90)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            
            if viewModel.exerc.count > 0 {
                let ind = find(value: exercises[index], in:viewModel.exerc)
                let exercise = viewModel.exerc[ind ?? 0]
                Image(exercise.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                    .padding(.all)
            }
            else {
                Image("Lunges")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(5)
                    .padding(.all)
            }
            if minutes3 < 10 && seconds3 < 10 {
                Text("0\(minutes3):0\(seconds3)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color("Gray2"))
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            else if minutes3 < 10 {
                Text("0\(minutes3):\(seconds3)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color("Gray2"))
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            
            else if seconds3 < 10 {
                Text("\(minutes3):0\(seconds3)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color("Gray2"))
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            
            else {
                Text("\(minutes3):\(seconds3)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: 120,minHeight: 50)
                    .background(Color("Gray2"))
                    .cornerRadius(10)
                    .font(.title)
                    .padding(.all)
            }
            
            HStack {
                Spacer()
                if index == exercises.capacity-1 {
                    NavigationLink(destination: ExerciseDone()){
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
                else {
                    Button(action:{
                        self.resetTimer(x: 2)
                        self.resetTimer(x: 3)
                        self.minutes2 = 1
                        self.minutes3 = 2
                        if timer2IsPaused{
                            self.startTimer2()
                        }
                        self.stopTimer3()
                        
                        self.index += 1
                        fetchBoolean = true;
                        
                        print("NEXT")
                    }){
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 40, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                    }
                    .padding(.all)
                }
            }
            
        }.background(Image("image"))
        .edgesIgnoringSafeArea([.top])
        .onAppear(){fetch()}
    }
    
    func startTimer1(){
        self.timer1IsPaused = false
        timer1 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds1 == 59 {
                self.seconds1 = 0
                if self.minutes1 == 59 {
                    self.minutes1 = 0
                }
                else {
                    self.minutes1 = self.minutes1 + 1
                }
            }
            else {
                self.seconds1 = self.seconds1 + 1
            }
        }
    }
    
    func startTimer2(){
        self.timer2IsPaused = false
        timer2 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds2 == 0 {
                self.seconds2 = 59
                if self.minutes2 == 0 {
                    self.stopTimer2()
                    self.resetTimer(x: 2)
                }
                else {
                    self.minutes2 = self.minutes2 - 1
                }
            }
            else {
                self.seconds2 = self.seconds2 - 1
            }
        }
    }
    func startTimer3(){
        self.timer3IsPaused = false
        timer3 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds3 == 0 {
                self.seconds3 = 59
                if self.minutes3 == 0 {
                    self.stopTimer3()
                    self.resetTimer(x: 3)
                }
                else {
                    self.minutes3 = self.minutes3 - 1
                }
            }
            else {
                self.seconds3 = self.seconds3 - 1
            }
        }
    }
    
    func stopTimer1(){
        timer1IsPaused = true
        timer1?.invalidate()
        timer1 = nil
    }
    
    func stopTimer2(){
        timer2IsPaused = true
        timer2?.invalidate()
        timer2 = nil
    }
    
    func stopTimer3(){
        timer3IsPaused = true
        timer3?.invalidate()
        timer3 = nil
    }
    
    func resetTimer(x: Int){
        if x == 1 {
            self.minutes1 = 0
            self.seconds1 = 0
        }
        else if x == 2 {
            self.minutes2 = 0
            self.seconds2 = 0
        }
        else {
            self.minutes3 = 0
            self.seconds3 = 0
        }
    }
    
    private func fetch (){
        if (fetchBoolean) {
            viewModel.fetchData()
            startTimer1()
            startTimer2()
            fetchBoolean = false;
        }
    }
    
    func find(value searchValue: String, in array: [Exercise]) -> Int?
    {
        for (index, value) in array.enumerated()
        {
            if value.name == searchValue {
                return index
            }
        }

        return nil
    }
}

struct ExerciseWorkout_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseWorkout(exercises: [])
    }
}
