//
//  ArtistDetailsController.swift
//  Musicplayer
//
//  Created by Ognjen on 9.12.22..
//

import UIKit
import Kingfisher

class ArtistDetailsController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var artistImageView: UIImageView!
    
    
    var artistID: String?
    var artistData: ArtistModel?
    var artistImages: ArtistImagesModel?
    var presenter: ArtistPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        if let artistID = artistID {
            presenter?.fetchArtistData(for: artistID)
            presenter?.fetchArtistImages(for: artistID)
        }
    }
    func setup(with artist: ArtistModel) {
        for i in artist.artists[0].blurbs {
            infoLabel.text! += i + "\n"
        }
        if let coverImage = artistImages?.images {
            let coverImages = coverImage[0].url
            let coverImageURL = URL(string: coverImages)
            artistImageView.kf.setImage(with: coverImageURL)
        }
        else {
            artistImageView.image = UIImage(named: "none")
        }
        
    }
    @IBAction func showTracksForArtist() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtistTopTracksController") as! ArtistTopTracksController
        vc.artistID = artistID
        vc.artistImage = artistImages?.images[0].url
        vc.presenter = ArtistTopTracksPresenter()
        show(vc, sender: self)
    }


}
extension ArtistDetailsController: ArtistPresenterDelegate {
    func imagePresenter(_ presenter: ArtistPresenter, imageData: ArtistImagesModel) {
        self.artistImages = imageData
    }
    
    func artistPresenter(_ presenter: ArtistPresenter, data: ArtistModel) {
        self.artistData = data
        setup(with: data)
    }
    
    
}
