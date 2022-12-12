//
//  ArtistTopTracksPresenter.swift
//  Musicplayer
//
//  Created by Ognjen on 12.12.22..
//

import Foundation
import Alamofire

protocol ArtistTopTracksPresenterDelegate: AnyObject {
    func topTracksPresenter(_ presenter: ArtistTopTracksPresenter, data: TrackData)
}

class ArtistTopTracksPresenter {
    
    var delegate: ArtistTopTracksPresenterDelegate?
    
    func fetchArtistTopData(for artist: String) {

        let baseURL = "https://api.napster.com/v2.2/artists/\(artist)/tracks/top?apikey=YzVkM2I1ODItMWQ2YS00ZDc0LThmNDUtMDg1MjRlZTg5ZTU5"
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        
        request.method = .get
        
        AF.request(request).response { [weak self] response in
            guard let self = self,
                  let data = response.data
            else { return }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(TrackData.self, from: data)
                self.delegate?.topTracksPresenter(self, data: userData)
                
            } catch let error {
                debugPrint(error)
            }
        }
    }
}
