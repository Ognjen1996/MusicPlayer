//
//  ArtistDetailsController.swift
//  Musicplayer
//
//  Created by Ognjen on 9.12.22..
//

import UIKit

class ArtistDetailsController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var artistID: String?
    var artistData: ArtistModel?
    var presenter: ArtistPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        if let artistID = artistID {
            presenter?.fetchArtistData(for: artistID)
            
        }
    }
    func setup(with artist: ArtistModel) {
        infoLabel.text = artist.artists[0].blurbs[0]
    }

}
extension ArtistDetailsController: ArtistPresenterDelegate {
    func artistPresenter(_ presenter: ArtistPresenter, data: ArtistModel) {
        self.artistData = data
        setup(with: data)
    }
    
    
}
