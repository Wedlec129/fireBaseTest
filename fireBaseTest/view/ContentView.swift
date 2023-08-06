//
//  ContentView.swift
//  firebase
//
//  Created by Борух Соколов on 26.07.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLogginIn = false
    
    
    var body: some View {
        if userIsLogginIn {
            withAnimation(.spring()) {
                ListView()
                    .environmentObject(DogsManager())
            }
        }
        else{
            //если не вошли то показываем окно входа
            withAnimation(.spring()) {
                welcomeScrean
            }
           
        }
    }
    
    var welcomeScrean: some View {
        
        ZStack{
            BackgroundApp()
            VStack(spacing: 20){
                TextWelcom()
                
                //поле ввода
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .fontWeight(.bold)
                //custom color to epty or not
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                Border()
                
                //поле ввода
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .fontWeight(.bold)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                Border()

                //кнопка регестрации
                Button(action: {
                    //sing up
                    register()
                    
                }
                       
                       , label: {
                   
                        Text("Sing up")
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 200,height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10,style: .circular)
                                    .fill(.linearGradient(colors: [.pink,.red], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                })
                .offset(y:100)
               

                
                Button(action: {
                    //login
                    login()
                }, label: {
                        Text("Already have a account ? Login")
                        .bold()
                        .foregroundColor(.white)
                        
                })
                
                .offset(y:110)
                
            }
            .frame(width: 350)
            
            
            
        }
        .ignoresSafeArea()
        
        
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            (resault, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else{
                print("success вошли в аккаунт!")
                
                //получаем дпнные об аккаунте
                Auth.auth().addStateDidChangeListener{auth, user in
                    
                    if user != nil {
                        userIsLogginIn.toggle()
                        print(user?.email ?? "")
                        print(user?.displayName ?? "")
                    }
                
                }
                
            }
        }
    }
    
    //sing IN
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

//расширение для вью для изменеия от услоия
extension View{
    func placeholder<Content: View>(when sholdShow:Bool, aligment: Alignment = .leading, @ViewBuilder placeholder: () -> Content ) -> some View{
        
        ZStack(alignment: aligment){
            placeholder().opacity(sholdShow ? 1 : 0)
            self
        }
        
    }
    
}

//задний фон прилодения
struct BackgroundApp: View {
    var body: some View {
        ZStack{
            Color.black
            RoundedRectangle(cornerRadius: 25,style: .circular)
            //.foregroundColor(.red)
                .foregroundStyle(.linearGradient(colors: [.pink,.red], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1010 ,height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -370)
        }
    }
}

//текст добро пожалоывть
struct TextWelcom: View {
    var body: some View {
        VStack{
            Text("Welcom to")
                .foregroundColor(.white)
                .font(.system(size: 55, weight: .bold, design: .rounded))
                .offset(x: -70, y: -120)
            Text("Dog notes")
                .foregroundColor(.white)
                .font(.system(size: 55, weight: .bold, design: .rounded))
                .offset(x: -70, y: -120)
        }
    }
}

//граница для полей
struct Border: View {
    var body: some View {
        Rectangle()
            .frame(width: 350,height: 1)
            .foregroundColor(.white)
    }
}
