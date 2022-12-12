//
//  TracksModel.swift
//  Musicplayer
//
//  Created by Ognjen on 6.12.22..
//

import Foundation
struct ArtistTrackModel: Codable {
    var tracks: [ArtistTrack]
}

struct ArtistTrack: Codable {
    var type: String
    var id: String
    var index: Int
    var disc: Int
    var href: String
    var playbackSeconds: Int
    var isExplicit: Bool
    var isStreamable: Bool
    var isAvailableInHiRes: Bool
    var name: String
    var isrc: String
    var shortcut: String
    var blurbs: [String]
    var artistId: String
    var artistName: String
    var albumName: String
    var formats: [ArtistFormats]
    var losslessFormats: [ArtistFormats]
    var albumId: String
    var isAvailableInAtmos: Bool
    var contributors: Contributors
    var links: Links
    var previewURL: String
}
struct ArtistFormats: Codable {
    var type: String
    var bitrate: Int
    var name: String
    var sampleBits: Int
    var sampleRate: Int
}
struct ArtistContributors: Codable {
    var guestMusician: String?
    var remixer: String?
    var producer: String?
    var composer: String?
    var engineer: String?
    var guestVocals: String?
    var primaryArtist: String
    var featuredPerformer: String?
}



