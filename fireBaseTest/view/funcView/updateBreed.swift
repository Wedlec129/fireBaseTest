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
    
    //аля ссылка
    @Binding public var Dogid:Int
    
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
                    withAnimation(.spring()) {
                        //закрываем экран
                        presentationMode.wrappedValue.dismiss()
                    }
                   
                    
                }, label: {
                    Text("Close")
                    
                })
                
                
                
                Button(action: {
                    withAnimation(.spring()) {
                        dogsManager.updateDog(id: Dogid, newdogBread: newdogBread)
                        
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

struct updateBreed_Previews: PreviewProvider {
    static var previews: some View {
        updateBreed(Dogid: .constant(1))
            .environmentObject(DogsManager())
    }
}
