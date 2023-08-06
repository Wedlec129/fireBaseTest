//
//  ListView.swift
//  fireBaseTest
//
//  Created by Борух Соколов on 03.08.2023.
//

import SwiftUI

struct ListView: View {
    //обекст который можно передовать из вью в ью
    @EnvironmentObject var dogsManager: DogsManager
    @State private var showPopUpNewDog = false
    
    @State private var showPopUpRenameDog = false
    
    var body: some View {
        
        NavigationView{
            //отображаем все обекты
            List(dogsManager.dogs, id: \.id) { dog in
                
                Text(dog.breed)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false ) {
                        
                        Button(action: {
                            dogsManager.remove(id: dog.id)
                        }, label: {
                            Image(systemName: "trash")
                        }).tint(.red)
                        
                               
                        Button(action: {
                            //dogsManager.remove(dogBread: dog.breed)
                            
                            dogsManager.updateDog(id: dog.id, newdogBread: "testingRename")
                            
                            //updateBreed(Dogid:dog.id)
                            
                        }, label: {
                            Image(systemName: "pencil")
                        }).tint(.blue)
                        
                            }
                    
                    .padding()
            }
            .navigationTitle("Dogs")
            
            //кнопки сверху
            
            //кнопка сверху +
            .navigationBarItems(trailing:
                                    Button(action: {
                //add
                showPopUpNewDog.toggle()
                
            }, label: {
                Image(systemName: "plus")
            }))
            
            //кнопка сверху reload(update)
            .navigationBarItems(trailing:
                                    Button(action: {
                dogsManager.fetchDogs()
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                
            }))
            
            
            //если тоглер нажат отображаем другой экран
            .sheet(isPresented: $showPopUpNewDog){
                newDogView()
            }
            
           
            
            
        }
       
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DogsManager())
    }
}
