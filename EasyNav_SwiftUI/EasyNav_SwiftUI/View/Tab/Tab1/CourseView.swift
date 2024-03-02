//
//  CourseView.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import SwiftUI

struct CourseView: View {
    
    @StateObject var courseVm: CoursesViewModel = CoursesViewModel()
    @EnvironmentObject private var appRouter: AppRouter<AppPage>
    
    var body: some View {
        
        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                LazyVStack(spacing: 10) {
                    
                    ForEach(courseVm.arrFinaldata,id: \.id) { data in
                        
                        CourseViewCell(finalData: data) {
                            
                            if data.data.isEmpty {
                                
                                let actions = HStack {
                                    Button(action: {
                                        
                                    }, label: { Text("OK") })
                                }

                                self.appRouter.open(alert: AppAlert(title: "", message: "No data found", actions: actions))
                                
                            } else {
                                
                                self.appRouter.push(page: .CourseListView(finalDataModel: data))
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        .onAppear {
            courseVm.readJson()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Course View")
        .toolbarRole(.navigationStack)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    
                    appRouter.pop()
                    
                } label: {
                    Text("Back")
                }

            }
          
            
        }
        
        
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
