//
//  CourseListView.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 21/04/23.
//

import SwiftUI

struct CourseListView: View {
    
    var finalData: finalModel
    @EnvironmentObject private var appRoute: AppRouter<AppPage>
    var arrColor: [Color] = [.brown , .gray , .orange , .teal, .mint , .pink]
    @State var isGridView:Bool = false
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0, alignment: .center), count: 2)
    
    var body: some View {
        
        VStack {
            
            
            if isGridView {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: columns,alignment: .center,spacing: 20) {
                        
                        ForEach(finalData.data,id: \.id) { item in
                            
                            CourseListCell(backGroundColor: arrColor.randomElement() ?? .mint, indexData: item, isGridView: isGridView,btnCardAction:  {
                                
                                appRoute.push(page: .CourseSingleView(indexDataModel: item))
                                
                            })
                            
                        }
                        
                    }
                    
                }
                
                
            } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        ForEach(finalData.data,id: \.id) { item in
                            
                            CourseListCell(backGroundColor: arrColor.randomElement() ?? .mint, indexData: item, isGridView: isGridView,btnCardAction: {
                                
                                appRoute.push(page: .CourseSingleView(indexDataModel: item))
                            })
                            
                        }
                        
                    }
                    
                }
                
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(finalData.headerTitle)
        .toolbarRole(.editor)
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
                    withAnimation {
                        self.isGridView.toggle()
                    }
                } label: {
                    Image(systemName: self.isGridView ?  "square.split.2x1.fill" :  "square.split.2x1")
                }
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    appRoute.popToRoot()
                } label: {
                    Text("main")
                }
                
            }
        
        }
        
        
        
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView(finalData: finalModel(headerTitle: "asdfafasfaf", data: []))
    }
}
