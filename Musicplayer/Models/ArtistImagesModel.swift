//
//  ArtistImagesModel.swift
//  Musicplayer
//
//  Created by Ognjen on 9.12.22..
//

import Foundation


struct ArtistImagesModel: Codable {
    var images: [ImagesData]
    var meta: MetaData
}
struct ImagesData: Codable {
    var type: String
    var id: String
    var url: String
    var contentId: String
    var width: Int
    var height: Int
    var isDefault: Bool
    var version: Int
    var imageType: String
}
