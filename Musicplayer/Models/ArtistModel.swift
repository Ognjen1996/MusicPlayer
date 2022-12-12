//
//  ArtistModel.swift
//  Musicplayer
//
//  Created by Ognjen on 9.12.22..
//

import Foundation

struct ArtistModel: Codable {
    var artists: [ArtistData]
    var meta: MetaData
}
struct ArtistData: Codable {
    var type: String
    var id: String
    var href: String
    var name: String
    var shortcut: String
    var blurbs: [String]
    var bios: [BiosData]?
    var albumGroups: AlbumGroupsData?
    var links: LinksData?
}
struct BiosData: Codable {
    var title: String
    var author: String
    var publishDate: String
    var bio: String
}
struct AlbumGroupsData: Codable {
    var others: [String]?
    var main: [String]?
    var compilations: [String]?
    var singlesAndEPs: [String]?
}
struct LinksData: Codable {
    var albums: Href?
    var images: Href?
    var posts: Href?
    var topTracks: Href?
    var genres: idHref?
    var stations: idHref?
    var contemporaries: idHref?
    var followers: idHref?
    var influences: idHref?
    var relatedProjects: idHref?
}
struct Href: Codable {
    var href: String?
}
struct idHref: Codable {
    var ids: [String]?
    var href: String?
}
struct MetaData: Codable {
    var totalCount: Int?
    var returnedCount: Int?
}

