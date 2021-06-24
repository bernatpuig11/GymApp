//
//  ListExerciseModel.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 9/5/21.
//


import Foundation
import FirebaseFirestore

class ListExerciseViewModel: ObservableObject {
    
    
    @Published var exerc = [Exercise]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("exerc").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.exerc = documents.map { (queryDocumentSnapshot) -> Exercise in
                let data = queryDocumentSnapshot.data()
               
                let name = data["name"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let difficulty = data["difficulty"] as? [String] ?? [""]
                let image = data["image"] as? String ?? ""
                return Exercise(name:name,description:description, difficulty:difficulty , image:image)
            }
        }
    }
}
