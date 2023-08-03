//
//  DogMenager.swift
//  firebase
//
//  Created by Борух Соколов on 03.08.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreTarget
import Foundation


struct Dog: Identifiable {
    var id: UUID
    var breed: String
    
}

class DogsManager : ObservableObject{
    
    @Published var dogs:[Dog] = []
    
    init(){
        
        fetchDogs()
    }
    func fetchDogs(){
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
       
        
        
    }
    
}

