//
//  CourseSingleView.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 24/04/23.
//

import SwiftUI

struct CourseSingleView: View {
    @EnvironmentObject private var appRoute: AppRouter<AppPage>
    var indexData: IndexModel
    
    var body: some View {
       
        VStack {
            
            Text("Hello, World!")
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(indexData.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    appRoute.pop()
                } label: {
                    Text("Back")
                }
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                
                Button {
                    appRoute.pop(to: .courseView)
                } label: {
                    Text("List")
                }
 
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    appRoute.popToRoot()
                    appRoute.selectedTabIdx = 1
                } label: {
                    Text("Tab2")
                }
                
            }
            
           
        }
        
    }
}

struct CourseSingleView_Previews: PreviewProvider {
    static var previews: some View {
        CourseSingleView(indexData: IndexModel(Dict: [:]))
    }
}
