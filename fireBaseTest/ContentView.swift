//
//  ContentView.swift
//  firebase
//
//  Created by Борух Соколов on 26.07.2023.
//

import SwiftUI
import Firebase
//its like tutorila
struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            TextField("Email  ", text: $email)
            SecureField("Password ",text: $password)
            
            VStack{
                Button(action: {login()}, label: {
                    Text("sing in") //вход
                        .padding()
                        .foregroundColor(.blue)
                })
                
                Button(action: {register()}, label: {
                    Text("sing up") //выход
                        .foregroundColor(.blue)
                })
                
                
            }
            .padding()
        }
        .padding()
    }
    
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            (resault, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else{
                print("success вошли в аккаунт!")
            }
        }
    }
    
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            (resault, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else{
                print("success зарегестрировали аккант!")
            }
        }
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
