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
    @IBOutlet weak var topTracksButton: UIButton!
    
    
    var artistID: String?
    var artistData: ArtistModel?
    var artistImages: ArtistImagesModel?
    var presenter: ArtistPresenter?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self

        settupButton()
        if let artistID = artistID {
            presenter?.fetchArtistData(for: artistID)
            presenter?.fetchArtistImages(for: artistID)
        }
    }
    private func settupButton() {
        topTracksButton.tintColor = .white
        topTracksButton.alpha = 0.4
        topTracksButton.setTitle("top tracks", for: .normal)
    }
    func setup(with artist: ArtistModel) {
        for i in artist.artists[0].blurbs {
            infoLabel.text! += i + "\n"
        }
        if infoLabel.text == "" {
            infoLabel.text = "No details available for this artist."
        }
        if let imageArray = artistImages?.images {
            if imageArray.isEmpty {
                artistImageView.image = UIImage(named: "none")
            }
            else {
                let coverImages = imageArray[0].url
                let coverImageURL = URL(string: coverImages)
                artistImageView.kf.setImage(with: coverImageURL)
            }
        }
    }
    
    @IBAction func showTracksForArtist() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ArtistTopTracksController") as! ArtistTopTracksController
        vc.artistID = artistID
        if let imageArray = artistImages?.images {
            if imageArray.isEmpty {
                vc.artistImage = "https://www.galenindia.com/detials.php?vId=45"
                }

            else {
                vc.artistImage = artistImages?.images[0].url
            }
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
