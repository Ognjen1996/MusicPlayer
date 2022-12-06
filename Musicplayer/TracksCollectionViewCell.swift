//
//  TracksCollectionViewCell.swift
//  Musicplayer
//
//  Created by Ognjen on 6.12.22..
//

import UIKit

class TracksCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var topListLabel: UILabel!
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var view: UIView!
    
    
    func setup(with track: Track) {
        var duration = Double(track.playbackSeconds)/60.0
        trackNameLabel.text = track.artistName + "\n\n" + track.name + "\nDuration: " +  String(format: "%.2f", duration) + "\nAlbum: " + track.albumName
        trackImage.image = UIImage(named: "song")
        
    }
}
