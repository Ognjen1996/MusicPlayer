//
//  TracksModel.swift
//  Musicplayer
//
//  Created by Ognjen on 6.12.22..
//

import Foundation
struct TrackData: Codable {
    var tracks: [Track]
}

struct Track: Codable {
    var type: String
    var id: String
    var index: Int
    var disc: Int
    var href: String
    var playbackSeconds: Int
    var explicit: Bool?
    var isExplicit: Bool?
    var isAvailableInHiRes: Bool?
    var isStreamable: Bool
    var name: String
    var isrc: String
    var shortcut: String
    var blurbs: [String]
    var artistId: String
    var artistName: String
    var albumName: String
    var formats: [Formats]
    var albumId: String
    var contributors: Contributors
    var links: Links
    var previewURL: String
    var isAvailableInAtmos: Bool?
    var losslessFormats: [Formats]?
}
struct Formats: Codable {
    var type: String
    var bitrate: Int
    var name: String
    var sampleBits: Int?
    var sampleRate: Int?
}
struct Contributors: Codable {
    var guestMusician: String?
    var remixer: String?
    var producer: String?
    var composer: String?
    var engineer: String?
    var guestVocals: String?
    var featuredPerformer: String?
    var primaryArtist: String
}
struct Links: Codable {
    var artists: idData
    var albums: idData
    var genres: idData
    var tags: idData
}
struct idData: Codable {
    var ids: [String]
    var href: String
}

