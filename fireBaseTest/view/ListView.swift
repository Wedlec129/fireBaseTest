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
    
    //тогглер показывать ли меню добавления дог
    @State private var showPopUpNewDog = false
    
    //тоглер показ ли меню редактирования дог и храним адрес дог
    @State private var showPopUpRenameDog = false
    @State private var RenameDogId :Int = 0
    
   
    var body: some View {
        
        NavigationView{
            //отображаем все обекты
            List(dogsManager.dogs, id: \.id) { dog in
                
                //наши обекты
                Text(dog.breed)
                    //свайп
                    .swipeActions(edge: .trailing, allowsFullSwipe: false ) {
                        
                        //кнопка удалить
                        Button(action: {
                            dogsManager.remove(id: dog.id) //ф-я удалить
                        }, label: {
                            Image(systemName: "trash")
                        }).tint(.red)
                        
                        //кнопка изменить
                        Button(action: {
                            //тогг
                            showPopUpRenameDog.toggle()
                            RenameDogId = dog.id //айди
                          //  dogsManager.updateDog(id: dog.id, newdogBread: "W")
                            
                           
                            
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
                //add тогл
                showPopUpNewDog.toggle()
                
            }, label: {
                Image(systemName: "plus")
            }))
            
            //кнопка сверху reload(update)
            .navigationBarItems(trailing:
                                    Button(action: {
                dogsManager.fetchDogs() //подгружаем данные
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath")
                
            }))
            
            
            //если тоглер нажат отображаем другой экран нов дог
            .sheet(isPresented: $showPopUpNewDog){
                newDogView()
            }
            
            //тог ренейм
            .sheet(isPresented: $showPopUpRenameDog){
                updateBreed(Dogid: $RenameDogId) //View
                    .environmentObject(dogsManager)
                    
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
