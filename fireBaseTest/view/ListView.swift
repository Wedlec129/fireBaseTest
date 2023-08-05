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
    @State private var showPopUp = false
    
    var body: some View {
        
        NavigationView{
            //отображаем все обекты
            List(dogsManager.dogs, id: \.id) { dog in
                Text(dog.breed)
                
                    .swipeActions {
                        Button(action: {
                            dogsManager.remove(dogBread: dog.breed)
                        }, label: {
                            Image(systemName: "trash")
                                
                            
                        })
                        .tint(.red)
                               
                            }
            }
            .navigationTitle("Dogs")
            //кнопка сверху +
            .navigationBarItems(trailing:
                                    Button(action: {
                //add
                showPopUp.toggle()
                
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
            .sheet(isPresented: $showPopUp){
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
