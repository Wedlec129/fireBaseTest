//
//  updateBreed.swift
//  fireBaseTest
//
//  Created by Борух Соколов on 06.08.2023.
//

import SwiftUI

struct updateBreed: View {
    @EnvironmentObject var dogsManager: DogsManager
    
    @State private var newdogBread = ""
    
    @State public var Dogid:Int = 1
    
    //тогглер по убранию окна вспыл
    @Environment(\.presentationMode) var presentationMode

       
    
    var body: some View {
        VStack{
            Text("Rename  Dog  🐶")
            .padding()
            TextField("Dog", text: $newdogBread)
                .padding()
                .padding(.vertical,100)
            
            HStack(spacing: 100){
                
                Button(action: {
                    //закрываем экран
                    presentationMode.wrappedValue.dismiss()
                   
                    
                }, label: {
                    Text("Close")
                    
                })
                
                
                
                Button(action: {
                    dogsManager.updateDog(id: Dogid, newdogBread: newdogBread)
                    //закрываем экран
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Text("Save")
                    
                })
                
                
                
                
                
                
            }
        }.padding()
    }
}

struct updateBreed_Previews: PreviewProvider {
    static var previews: some View {
        updateBreed()
    }
}
