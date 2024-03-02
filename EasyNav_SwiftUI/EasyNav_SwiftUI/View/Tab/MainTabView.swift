//
//  mainTabView.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject private var appRouter: AppRouter<AppPage>
    
    var body: some View {
        
        ZStack {
            
            TabView(selection: $appRouter.selectedTabIdx) {
                
                Tab1View()
                    .tabItem {
                        Text("tab1")
                        Image(systemName: appRouter.selectedTabIdx == 0 ? "square.and.arrow.up.fill" : "square.and.arrow.up")
                    }
                    .tag(0)
                
                Tab2View()
                    .tabItem {
                        Text("tab2")
                        Image(systemName: appRouter.selectedTabIdx == 1 ? "square.and.arrow.up.on.square.fill" : "square.and.arrow.up.on.square")
                    }
                    .tag(1)
                
                Tab3View()
                    .tabItem {
                        Text("tab3")
                        Image(systemName: appRouter.selectedTabIdx == 1 ? "square.and.arrow.down.on.square.fill" : "square.and.arrow.down.on.square")
                    }
                    .tag(2)
                
            }
            
        }
        .accentColor(.white)
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct mainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewDevice("iPhone 11")
            
    }
}
