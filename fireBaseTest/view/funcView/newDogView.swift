//
//  newDogView.swift
//  fireBaseTest
//
//  Created by Борух Соколов on 04.08.2023.
//

import SwiftUI

struct newDogView: View {
    @EnvironmentObject var dogsManager: DogsManager
    @State private var newDog = ""
    
    //тогглер по убранию окна вспыл
    @Environment(\.presentationMode) var presentationMode

       
    
    var body: some View {
        VStack{
            Text("Add new Dog  🐕")
            TextField("Dog", text: $newDog)
                .padding()
                .padding(.vertical,100)
            
            HStack(spacing: 100){
                
                Button(action: {
                    withAnimation(.spring()) {
                        //закрываем экран
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    Text("Close")
                    
                })
                
                
                
                Button(action: {
                    withAnimation(.spring()) {
                        //add
                        dogsManager.addDog(dogBread: newDog)
                        
                        //закрываем экран
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    Text("Save")
                    
                })
                
                
                
               
                
                
            }
        }.padding()
    }
}

struct newDogView_Previews: PreviewProvider {
    static var previews: some View {
        newDogView()
    }
}
