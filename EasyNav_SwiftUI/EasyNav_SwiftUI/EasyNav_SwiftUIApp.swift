//
//  EasyNav_SwiftUIApp.swift
//  EasyNav_SwiftUI
//
//  Created by Jeet Rajput  on 02/03/24.
//

import SwiftUI

@main
struct EasyNav_SwiftUIApp: App {
    @StateObject var mainRouter = MainRouter.shared
    
    var body: some Scene {
        WindowGroup {
           AppRouterView()
                .id(mainRouter.contentID)
                
        }
    }
}
