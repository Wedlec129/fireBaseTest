//
//  fireBaseTestApp.swift
//  fireBaseTest
//
//  Created by Борух Соколов on 03.08.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct fireBaseTestApp: App {
    
    @StateObject var dogsManager = DogsManager()
    
    //инициализируем фаербейз
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
            
            //ContentView()
            
            
            ListView()
                .environmentObject(dogsManager)
            
            
        }
    }
}
