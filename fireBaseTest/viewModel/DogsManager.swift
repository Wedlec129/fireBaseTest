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



class DogsManager : ObservableObject{
    
    @Published var dogs:[Dog] = []
    
    init(){
        fetchDogs()
    }
    
    func fetchDogs(){
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    
                    let data = document.data()
                    
                    let id = data["id"] as? Int ?? 0
                    let breed = data["breed"] as? String ?? ""
                    
                    let dog = Dog(id: id, breed: breed)
                    self.dogs.append(dog)
                    
                }
            }
            
        }
        
        
    }
    
    func addDog(dogBread:String){
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogBread)
        ref.setData(["breed" : dogBread,"id" : dogs.count  ]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
            
        }
        
    }
    
}


