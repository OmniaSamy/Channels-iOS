//
//  HomePresenter.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

class ComicPresenter {
    
    private var comicList: [Comic]?
    private weak var delegate: homeDelegate?
    
    init(delegate: homeDelegate) {
        self.delegate = delegate
    }
    
    func getData() {
        NetworkManager.shared.getComics(completion: { (result: Result<MarvelResults, NetworkError>, _) in
            
            switch result {
            case .success(let comics):
                print(comics.results)
                self.comicList = comics.results
                self.delegate?.getComicSucess()
            case .failure(let error):
                self.delegate?.getComicFail(errorMessage: error.message ?? "")
            }
        })
    }
    
    func getComicAtIndex(index: IndexPath) -> Comic? {
        return comicList?[index.row]
    }
    
    func getComicListCount() -> Int {
        return comicList?.count ?? 0
    }
}
