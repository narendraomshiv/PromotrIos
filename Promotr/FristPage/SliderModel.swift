//
//  SliderModel.swift
//  Promotr
//
//  Created by Mac on 2/22/23.
//

import Foundation
struct SliderModel : Codable {
    let errors : Bool?
    let data : SliderKey?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(SliderKey.self, forKey: .data
        )
    }
}
struct SliderKey:Codable {
    var appSliders : [SliderData]?
    enum CodingKeys: String, CodingKey {
        case appSliders = "appSliders"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        appSliders = try values.decodeIfPresent([SliderData].self, forKey: .appSliders)
    }
}
struct SliderData:Codable {
    var id :Int?
    var title: String?
    var subtitle: String?
    var full_image_url: String?
    var image_url:String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case subtitle = "subtitle"
        case full_image_url = "full_image_url"
        case image_url = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
        full_image_url = try values.decodeIfPresent(String.self, forKey: .full_image_url)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        
    }
}
