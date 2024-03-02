//
//  CoursesModel.swift
//  KalpeshDemo
//
//  Created by HasnianMansuri on 18/04/23.
//

import UIKit

let kCourseId = "id"
let kCourseLabel = "label"
let kCourses = "courses"
let kCourseSmart = "smart"
let kCourseDefault = "is_default"
let kCourseArchive = "is_archive"
let kCourseDescription = "description"

class CoursesModel: NSObject {
    
    let id, label, smart: String
    let courses: [Int]
    let isDefault, isArchive: Int
    let coursedescription: String
    
    
    init?(dictionary: [String:Any]) {
        self.id = dictionary[kCourseId] as? String ?? ""
        self.label = dictionary[kCourseLabel] as? String ?? ""
        self.smart = dictionary[kCourseSmart] as? String ?? ""
        
        let coursesArray =  dictionary[kCourses] as? [Int] ?? []
        self.courses = coursesArray
        
        self.isDefault = dictionary[kCourseDefault] as? Int ?? 0
        self.isArchive = dictionary[kCourseArchive] as? Int ?? 0
        
        self.coursedescription = dictionary[kCourseDescription] as? String ?? ""
    }
}


struct IndexModel: Codable {
    var downloadid, cdDownloads, id: Int
    var title: String
    var status: Int
    var releaseDate: String
    var authorid, videoCount: Int
    var styleTags: [String]
    var skillTags: [String]
    var seriesTags, curriculumTags: [String]
    var educator: String
    var owned, sale: Int
    var purchaseOrder: Bool
    var watched: Int
    var progressTracking: Double

    enum CodingKeys: String, CodingKey {
        case downloadid
        case cdDownloads = "cd_downloads"
        case id, title, status
        case releaseDate = "release_date"
        case authorid
        case videoCount = "video_count"
        case styleTags = "style_tags"
        case skillTags = "skill_tags"
        case seriesTags = "series_tags"
        case curriculumTags = "curriculum_tags"
        case educator, owned, sale
        case purchaseOrder = "purchase_order"
        case watched
        case progressTracking = "progress_tracking"
    }
    
    init(downloadid: Int, cdDownloads: Int, id: Int, title: String, status: Int, releaseDate: String, authorid: Int, videoCount: Int, styleTags: [String], skillTags: [String], seriesTags: [String], curriculumTags: [String], educator: String, owned: Int, sale: Int, purchaseOrder: Bool, watched: Int, progressTracking: Double) {
        self.downloadid = downloadid
        self.cdDownloads = cdDownloads
        self.id = id
        self.title = title
        self.status = status
        self.releaseDate = releaseDate
        self.authorid = authorid
        self.videoCount = videoCount
        self.styleTags = styleTags
        self.skillTags = skillTags
        self.seriesTags = seriesTags
        self.curriculumTags = curriculumTags
        self.educator = educator
        self.owned = owned
        self.sale = sale
        self.purchaseOrder = purchaseOrder
        self.watched = watched
        self.progressTracking = progressTracking
    }
    
    init(Dict:[String:Any]) {

        self.downloadid = Dict[IndexModelKey.downloadid] as? Int ?? 0
        self.cdDownloads = Dict[IndexModelKey.cdDownloads] as? Int ?? 0
        self.id = Dict[IndexModelKey.id] as? Int ?? 0
        self.title = Dict[IndexModelKey.title] as? String ?? ""
        self.status = Dict[IndexModelKey.status] as? Int ?? 0
        self.releaseDate = Dict[IndexModelKey.releaseDate] as? String ?? ""
        self.authorid = Dict[IndexModelKey.authorid] as? Int ?? 0
        self.videoCount = Dict[IndexModelKey.videoCount] as? Int ?? 0
        self.styleTags = Dict[IndexModelKey.styleTags] as? [String] ?? []
        self.skillTags = Dict[IndexModelKey.skillTags] as? [String] ?? []
        self.seriesTags = Dict[IndexModelKey.seriesTags] as? [String] ?? []
        self.curriculumTags = Dict[IndexModelKey.curriculumTags] as? [String] ?? []
        self.educator = Dict[IndexModelKey.educator] as? String ?? ""
        self.owned = Dict[IndexModelKey.owned] as? Int ?? 0
        self.sale = Dict[IndexModelKey.sale] as? Int ?? 0
        self.purchaseOrder = Dict[IndexModelKey.purchaseOrder] as? Bool ?? false
        self.watched = Dict[IndexModelKey.watched] as? Int ?? 0
        self.progressTracking = Dict[IndexModelKey.progressTracking] as? Double ?? 0.0

    }
    
}

enum IndexModelKey {
    static let downloadid = "downloadid"
    static let cdDownloads = "cd_downloads"
    static let id = "id"
    static let title = "title"
    static let status = "status"
    static let releaseDate = "release_date"
    static let authorid = "authorid"
    static let videoCount = "video_count"
    static let styleTags = "style_tags"
    static let skillTags = "skill_tags"
    static let seriesTags = "series_tags"
    static let curriculumTags = "curriculum_tags"
    static let educator = "educator"
    static let owned = "owned"
    static let sale = "sale"
    static let purchaseOrder = "purchase_order"
    static let watched = "watched"
    static let progressTracking = "progress_tracking"
}



struct finalModel {
    
    var headerTitle: String
    var data: [IndexModel]
    var id = UUID().uuidString
    
    init(headerTitle: String, data: [IndexModel]) {
        self.headerTitle = headerTitle
        self.data = data
    }
    
}
