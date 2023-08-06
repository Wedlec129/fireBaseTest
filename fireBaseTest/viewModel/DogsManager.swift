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

//наша модель данных где мы определяем как будем парсить


class DogsManager : ObservableObject{
    
    //массив наших обектов
    @Published var dogs:[Dog] = []
    
    //инициализатор
    init(){
        fetchDogs()
    }
    
    //загружаем данные
    func fetchDogs(){
        dogs.removeAll() //удаляем старые данные
        
        //загружаем новые из колекции дог
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
                    
                    //по поляем считываем
                    let id = data["id"] as? Int ?? 0
                    let breed = data["breed"] as? String ?? ""
                    
                    //создаём обеккт и кидаем его в массив
                    let dog = Dog(id: id, breed: breed)
                    self.dogs.append(dog)
                    
                }
            }
            
        }
        
        
    }
    
    //добавляем
    func addDog(dogBread:String){
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(String((dogs.last?.id ?? 0)+1)) //название документа
        ref.setData(["breed" : dogBread,"id" : (dogs.last?.id ?? 0)+1 ]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
        fetchDogs()
        
    }
    
    
    //удаляем
    func remove(id:Int){
        let db = Firestore.firestore()
        
        db.collection("Dogs").document(String(id)).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }

        fetchDogs()
        
    }
    
    func updateDog(id:Int, newdogBread:String){
        let db = Firestore.firestore()
        
        db.collection("Dogs").document(String(id)).updateData(["breed": newdogBread]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated!")
                
            }
        }
        fetchDogs()
    }
    
}


