//
//  CourseViewCell.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import SwiftUI

struct CourseViewCell: View {
    
    var finalData: finalModel
    var btnShowAction: () -> Void
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            // header View
            VStack {
                
                HStack {
                    
                    Text(self.finalData.headerTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        btnShowAction()
                    } label: {
                        Text("Show all")
                            .frame(height: 50)
                    }
                    
                }
                .padding([.leading,.trailing], 20)
                
            }
            
            Divider()
            
            // lazyHStack
            
            VStack {
                
                if finalData.data.isEmpty {
                    
                    Text("No Data Found")
                        .fontWeight(.bold)
                    
                } else {
                    
                    GeometryReader { geo in
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(finalData.data,id: \.id)  { item in
                                    
                                    VStack(alignment: .leading,spacing: 10) {
                                        Text("Title = \(item.title)")
                                        Text("Realse date = \(item.releaseDate)")
                                    }
                                    .padding(.all)
                                    .frame(maxWidth: geo.size.width,maxHeight: geo.size.height)
                                    
                                    Divider()
                                    
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            .frame(height: 120)
           
               
                
        }
        .background(Color.gray)
        .cornerRadius(20)
        .padding(.all, 20)
        
       
       
        
    }
}

struct CourseViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CourseViewCell(finalData: finalModel(headerTitle: "Testing", data: []), btnShowAction: {})
            
    }
}
