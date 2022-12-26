

import UIKit

class ArtistTopTracksController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var artistInfoLabel: UILabel!
    
    var presenter: ArtistTopTracksPresenter?
    var artistTracks: [Track] = [] {
        didSet {
            collectionView.reloadData()
            if artistTracks.isEmpty {
                artistInfoLabel.text =  "No additional tracks for this artist"
            }
            else {
                artistInfoLabel.text = artistTracks[0].artistName + "'s top tracks"
            }
        }
    }
    var artistID: String!
    var artistImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        navBarSetup()
        
        presenter?.fetchArtistTopData(for: artistID)

    }
    func navBarSetup() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .black
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        title = "Top Tracks"
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
            cell.topListLabel.text = String(indexPath.row + 1) + ". "
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
        vc.flag = 1
        self.present(vc, animated: true)
    }
}

extension ArtistTopTracksController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width / 1, height: collectionViewFrame.height / 3)
    }
}

