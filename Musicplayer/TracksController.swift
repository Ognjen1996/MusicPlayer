//
//  ViewController.swift
//  Musicplayer
//
//  Created by Ognjen on 6.12.22..
//

import UIKit


class TracksController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var presenter: TracksPresenter?
    var tracks: [Track]? = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter?.fetchTracks()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 70)

        collectionView.collectionViewLayout = layout
        
    }
}
extension TracksController: TracksPresenterDelegate {
    func tracksPresenter(_ presenter: TracksPresenter, data: TrackData) {
        self.tracks = data.tracks
    }
}
extension TracksController: UICollectionViewDelegate {
    
}
extension TracksController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tracks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TracksCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "TracksCollectionViewCell", for: indexPath) as! TracksCollectionViewCell
        guard let tracks = tracks else { return cell}
        cell.setup(with: tracks[indexPath.row])
        cell.topListLabel.text = String(indexPath.row) + ". "
        return cell
    }
}
extension TracksController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width / 1, height: collectionViewFrame.height / 3)
    }
}

