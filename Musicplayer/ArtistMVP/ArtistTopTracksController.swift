

import UIKit

class ArtistTopTracksController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: ArtistTopTracksPresenter?
    var artistTracks: [Track] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    var artistID: String!
    var artistImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        presenter?.fetchArtistTopData(for: artistID)


        // Do any additional setup after loading the view.
    }

}
extension ArtistTopTracksController: ArtistTopTracksPresenterDelegate {
    func topTracksPresenter(_ presenter: ArtistTopTracksPresenter, data: TrackData) {
        self.artistTracks = data.tracks
        
    }
}
extension ArtistTopTracksController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artistTracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TracksCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TracksCollectionViewCell", for: indexPath) as! TracksCollectionViewCell
        if let artistImage = artistImage {
            cell.setup(with: artistTracks[indexPath.row], and: artistImage)
        }

        return cell
    }
    
    
}
extension ArtistTopTracksController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PlayerController") as! PlayerController
        let track = artistTracks[indexPath.row]
        let url = artistTracks[indexPath.row].previewURL
        vc.track = track
        show(vc, sender: self)
    }
}

extension ArtistTopTracksController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width / 1, height: collectionViewFrame.height / 3)
    }
}

