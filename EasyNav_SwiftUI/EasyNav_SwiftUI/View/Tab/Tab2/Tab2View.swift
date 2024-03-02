//
//  Tab2View.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import SwiftUI

struct Tab2View: View {
    
    @EnvironmentObject private var appRoute: AppRouter<AppPage>
    
    var body: some View {
       
        ZStack {
            
            Color.yellow
                .ignoresSafeArea()
            
            Button {
                withAnimation {
                    UserDefaults.standard.setValue(false, forKey: kisLogin)
                    MainRouter.shared.toContentView()
                }
            
            } label: {
                Text("Logout")
            }

            
        }
        
    }
}

struct Tab2View_Previews: PreviewProvider {
    static var previews: some View {
        Tab2View()
    }
}
