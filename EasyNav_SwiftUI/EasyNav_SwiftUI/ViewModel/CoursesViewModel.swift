//
//  CoursesViewModel.swift
//  navigationSWIFTUI
//
//  Created by JeetRajput on 20/04/23.
//

import Foundation

class CoursesViewModel: ObservableObject {
    
    @Published var arrFinaldata: [finalModel] = []
    
    
    func readJson() {
        // Get url for file
        
        if !self.arrFinaldata.isEmpty {
            self.arrFinaldata.removeAll()
        }
        
        do {
            if let file = Bundle.main.url(forResource: "response", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    let arrayNew = object["result"] as? [String: Any] ?? [:]
                    let newIndex = arrayNew["index"] as? [[String: Any]] ?? []
                    
                    let newCollections = arrayNew["collections"] as? [String: Any] ?? [:]
                    let newSmart = newCollections["smart"] as? [[String: Any]] ?? []
                    
                    let courseObject = newSmart.compactMap(CoursesModel.init)
                    let indexObject = newIndex.compactMap(IndexModel.init)

                    for i in stride(from: 0, through: courseObject.count-1, by: 1) {
                        var arrindex: [IndexModel] = []
                        for j in stride(from: 0, through: courseObject[i].courses.count - 1, by: 1) {
                            arrindex.append(contentsOf: indexObject.filter({$0.id == courseObject[i].courses[j]}))
                        }
                        self.arrFinaldata.append(finalModel(headerTitle: courseObject[i].label, data: arrindex))
                    }
                    
                    print(object)
                    
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
