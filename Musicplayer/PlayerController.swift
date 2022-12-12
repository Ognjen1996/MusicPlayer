//
//  PlayerController.swift
//  Musicplayer
//
//  Created by Ognjen on 6.12.22..
//

import UIKit
import AVFoundation
import AVKit

class PlayerController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var albumCoverImageView: UIImageView!
    
    var player = AVPlayer()
    var playerController = AVPlayerViewController()
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playTrack()
        // Do any additional setup after loading the view.
    }
    
    func playTrack() {
        infoLabel.text = track.artistName + "\n\n" + track.albumName
        let url = URL(string: track.previewURL)
        self.player = AVPlayer(url: url!)
        playerController.player = player
        
        albumCoverImageView.frame = containerView.bounds
        albumCoverImageView.image = UIImage(named: "song")
        albumCoverImageView.contentMode = .top
        playerController.contentOverlayView?.addSubview(albumCoverImageView)
        self.addChild(playerController)
        playerController.view.frame = containerView.bounds
        containerView.addSubview(playerController.view)
        
        player.play()
    }
    func stopTrack() {
        player.pause()
    }
    
    @IBAction func showDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ArtistDetailsController") as! ArtistDetailsController
        vc.presenter = ArtistPresenter()
        vc.artistID = track.artistId
        stopTrack()
        show(vc, sender: self)
    }
    
}
