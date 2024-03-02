//
//  CourseListCell.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 21/04/23.
//

import SwiftUI

struct CourseListCell: View {
    
    var backGroundColor:Color = .mint
    var indexData: IndexModel
    var isGridView:Bool
    var btnCardAction: () -> Void
    
    var body: some View {
       
        VStack(spacing: 5) {
            
            VStack {
                
                if !isGridView {
                    
                    VStack(spacing: 10) {
                
                        RowCell(key: "title", value: indexData.title)
                        RowCell(key: "release date", value: indexData.releaseDate)
                        RowCell(key: "educator", value: indexData.educator)
                        RowCell(key: "owned", value: "\(indexData.owned)")
                        RowCell(key: "sale", value: "\(indexData.sale)")
                        RowCell(key: "purchase order", value: "\(indexData.purchaseOrder)")
                        RowCell(key: "watched", value: "\(indexData.watched)")
                        
                    }
                    .padding(.all)
                    
                } else {
                    
                    VStack(alignment: .leading,spacing: 10) {
                        
                        columnCell(key: "title", value: indexData.title)
                        columnCell(key: "release date", value: indexData.releaseDate)
                        columnCell(key: "educator", value: indexData.educator)
                        columnCell(key: "owned", value: "\(indexData.owned)")
                        columnCell(key: "sale", value: "\(indexData.sale)")
                        columnCell(key: "purchase order", value: "\(indexData.purchaseOrder)")
                        columnCell(key: "watched", value: "\(indexData.watched)")
                        
                    }
                    .padding([.top,.bottom])
                    .padding([.leading,.trailing],10)
                    
                }
               
                
            }
            .frame(maxWidth: self.isGridView ? UIScreen.main.bounds.width * 0.45 : UIScreen.main.bounds.width * 0.85)
            .frame(maxHeight: self.isGridView ? UIScreen.main.bounds.height * 0.6 : .greatestFiniteMagnitude)
            .background(backGroundColor)
            .cornerRadius(self.isGridView ? 15 : 25)
            .shadow(color: .gray, radius: 5, x: 0, y: 5)

        }
        .onTapGesture {
            btnCardAction()
        }
        
        
        
        
    }
}

extension CourseListCell {
    
    func RowCell(key: String,value: String) -> some View {
        
        VStack {
            
            HStack(alignment: .top) {
                
                Text("\(key) :")
                    .fontWeight(.medium)
                    .fontWidth(.standard)
                    .font(Font.system(size: 16))
                    .foregroundColor(.white)
                Spacer()
                Text(value)
                    .fontWeight(.light)
                    .fontWidth(.standard)
                    .font(Font.system(size: 16))
                    .foregroundColor(.black)
                
            }
            
        }
        
    }
    
    func columnCell(key:String,value:String) -> some View {
        
        VStack(alignment: .leading,spacing: 5) {
            
            VStack(alignment: .leading,spacing: 5) {
                
                Text("\(key):")
                    .fontWeight(.medium)
                    .fontWidth(.standard)
                    .font(Font.system(size: 16))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(value)
                    .fontWeight(.light)
                    .fontWidth(.standard)
                    .font(Font.system(size: 16))
                    .foregroundColor(.black)
                
            }

        }
        
    }
    
    
}


struct CourseListCell_Previews: PreviewProvider {
    static var previews: some View {
        CourseListCell(indexData: IndexModel(Dict: [:]), isGridView: true,btnCardAction: {})
            .previewLayout(.sizeThatFits)
    }
}
