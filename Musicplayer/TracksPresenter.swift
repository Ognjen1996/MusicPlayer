//
//  HomePresenter.swift
//  Musicplayer
//
//  Created by Ognjen on 6.12.22..
//

import Foundation
import Alamofire

protocol TracksPresenterDelegate: AnyObject {
    func tracksPresenter(_ presenter: TracksPresenter, data: TrackData)
}

class TracksPresenter {
    
    weak var delegate: TracksPresenterDelegate?
    
    func fetchTracks() {
        let baseUrl = "https://api.napster.com/v2.1/tracks/top?apikey=YzVkM2I1ODItMWQ2YS00ZDc0LThmNDUtMDg1MjRlZTg5ZTU5"
        guard let url = URL(string: baseUrl) else { return }
        var request = URLRequest(url: url)
        
        request.method = .get
        
        AF.request(request).response { [weak self] response in
            guard let self = self,
                  let data = response.data
            else { return }
            
            do {
                let decoder = JSONDecoder()
                let userData = try decoder.decode(TrackData.self, from: data)
                self.delegate?.tracksPresenter(self, data: userData)
                
            } catch let error {
                debugPrint(error)
            }
                        
            
        }
    }
}
