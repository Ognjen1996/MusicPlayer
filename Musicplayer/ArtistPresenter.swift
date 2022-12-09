//
//  ArtistPresenter.swift
//  Musicplayer
//
//  Created by Ognjen on 9.12.22..
//

import Foundation
import Alamofire

protocol ArtistPresenterDelegate: AnyObject {
    func artistPresenter(_ presenter: ArtistPresenter, data: ArtistModel)
}

class ArtistPresenter {
    
    weak var delegate: ArtistPresenterDelegate?
    
    

    func fetchArtistData(for artist: String) {

        let baseUrl = "https://api.napster.com//v2.2/artists/\(artist))?apikey=YzVkM2I1ODItMWQ2YS00ZDc0LThmNDUtMDg1MjRlZTg5ZTU5"
        guard let url = URL(string: baseUrl) else { return }
        var request = URLRequest(url: url)
        
        request.method = .get
        
        AF.request(request).response { [weak self] response in
            guard let self = self,
                  let data = response.data
            else { return }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(ArtistModel.self, from: data)
                self.delegate?.artistPresenter(self, data: userData)
                
            } catch let error {
                debugPrint(error)
            }
        }
    }
}
