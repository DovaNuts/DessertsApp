//
//  DessertsAppApp.swift
//  DessertsApp
//
//  Created by Axel Gonzalez on 08/08/23.
//

import SwiftUI

@main
struct DessertsApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            DessertListView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
