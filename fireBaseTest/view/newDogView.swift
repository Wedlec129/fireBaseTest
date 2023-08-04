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
    
    @Environment(\.presentationMode) var presentationMode

       
    
    var body: some View {
        VStack{
            TextField("Dog", text: $newDog)
            
            Button(action: {
                //add
                dogsManager.addDog(dogBread: newDog)
                
                presentationMode.wrappedValue.dismiss()

            }, label: {
                Text("Save")
                
            })
            
        }.padding()
    }
}

struct newDogView_Previews: PreviewProvider {
    static var previews: some View {
        newDogView()
    }
}
