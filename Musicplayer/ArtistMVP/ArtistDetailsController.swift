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
        if infoLabel.text == "" {
            infoLabel.text = "No details available for this artist."
        }
        if artistImages?.images.indices.contains(0) ?? false {
            if let coverImage = artistImages {
                let coverImages = coverImage.images[0].url
                let coverImageURL = URL(string: coverImages)
                artistImageView.kf.setImage(with: coverImageURL)
            }
        }
        else {
            artistImageView.image = UIImage(named: "none")
        }
        
    }
    @IBAction func showTracksForArtist() {
        let pc = storyboard?.instantiateViewController(withIdentifier: "PlayerController") as! PlayerController
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtistTopTracksController") as! ArtistTopTracksController
        vc.artistID = artistID
        if artistImages?.images.indices.contains(0) ?? false {
            if let artistImages = artistImages {
                vc.artistImage = artistImages.images[0].url
            }
        }
        else {
            vc.artistImage = "https://www.galenindia.com/detials.php?vId=45"
        }
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
