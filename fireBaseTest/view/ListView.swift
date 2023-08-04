//
//  ListView.swift
//  fireBaseTest
//
//  Created by Борух Соколов on 03.08.2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dogsManager: DogsManager
    @State private var showPopUp = false
    
    var body: some View {
        NavigationView{
            
            List(dogsManager.dogs, id: \.id) { dog in
                Text(dog.breed)
            }
           
            
            .navigationTitle("Dogs")
            .navigationBarItems(trailing:
                                    Button(action: {
                //add
                showPopUp.toggle()
                
            }, label: {
                
                Image(systemName: "plus")
                
            }))
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
