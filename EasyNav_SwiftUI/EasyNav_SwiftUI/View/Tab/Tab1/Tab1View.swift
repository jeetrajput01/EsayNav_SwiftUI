//
//  Tab1View.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import SwiftUI

struct Tab1View: View {
    
    @EnvironmentObject private var appRouter: AppRouter<AppPage>
    
    var body: some View {
        ZStack {
            
            Color.brown
                .ignoresSafeArea()
            
            VStack {
                
                Text("Go To Data Screen")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        
                        appRouter.push(page: .courseView)
                        
                    }
                
            }
            
        }
    }
}

struct Tab1View_Previews: PreviewProvider {
    static var previews: some View {
        Tab1View()
    }
}
