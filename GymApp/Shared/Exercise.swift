//
//  Exercises.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 8/4/21.
//

import Foundation

struct Exercise:Identifiable{
    
     
    let id: String = UUID().uuidString
    let name: String
    let description: String
    let difficulty: [String]?
    let image:String
}


