//
//  ChannelHomePresenter.swift
//  Channels
//
//  Created by Omnia Samy on 4/28/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

class ChannelHomePresenter {
    
    private var categoriesList: [CategoryModel]?
    private var mediaList: [MediaModel]?
    private var channelList: [ChannelModel]?
    private weak var delegate: HomeDelegate?
    
    init(delegate: HomeDelegate) {
        self.delegate = delegate
        //        _ = getCategories()
        //        _ = getMedia()
        //        _ = getChannel()
        
        getChannel()
        getCategories()
        getMedia()
    }
    
    func getNumberOFsections() -> Int {
        
        var sectionCount = 0
        
        if !(mediaList?.isEmpty ?? true) {
            sectionCount += 1
        }
        
        if !(categoriesList?.isEmpty ?? true) {
            sectionCount += 1
        }
        
        if !(channelList?.isEmpty ?? true) {
            sectionCount += (channelList?.count ?? 0)
        }
        return sectionCount //(channelList?.count ?? 0) + 2
    }
    
    func getCategoryAtIndex(index: IndexPath) -> CategoryModel? {
        guard let category = categoriesList?[index.row] else {
            return nil
        }
        return category
    }
    
    func getCategoriesListCount() -> Int {
        return categoriesList?.count ?? 0
    }
    
    func getMediaListCount() -> Int {
        return mediaList?.count ?? 0
    }
    
    func getMediaList() -> [MediaModel]? {
        return mediaList
    }
    
    func getChannelAtIndex(index: Int) -> ChannelModel? {
        
        if channelList?.isEmpty ?? true {
            return nil
        }
        
        if channelList?.count ?? 0 <= index {
            return nil
        }
        
        guard let channel = channelList?[index] else {
            return nil
        }
        return channel
    }
    
    func getCategories() {
        NetworkManager.shared.getCategories(completion: { (result: Result<CategoryList, NetworkError>, _) in
            
            switch result {
            case .success(let categories):
                self.categoriesList = categories.categories
                self.delegate?.fetchCategoriesSucess()
            case .failure(let error):
                print(error)
                self.delegate?.fetchFail(error: error)
            }
        })
    }
    
    func getMedia() {
        
        NetworkManager.shared.getMedia(completion: { (result: Result<MediaList, NetworkError>, _) in
            
            switch result {
            case .success(let media):
                self.mediaList = media.media
                self.delegate?.fetchCategoriesSucess()
            case .failure(let error):
                print(error)
                self.delegate?.fetchFail(error: error)
            }
        })
    }
    
    func getChannel() {
        
        NetworkManager.shared.getChannel(completion: { (result: Result<ChannelList, NetworkError>, _) in
            
            switch result {
            case .success(let channel):
                self.channelList = channel.channels
                self.delegate?.fetchCategoriesSucess()
            case .failure(let error):
                print(error)
                self.delegate?.fetchFail(error: error)
            }
        })
    }
}

protocol HomeDelegate: class {
    func fetchFail(error: NetworkError)
    func fetchCategoriesSucess()
}

//------------------------------
//    func getCategories() {
//
//        let categoriesList = Bundle.main.decode(NetworkResponse<CategoryList>.self,
//                                                from: "Category.Success.json")
//        self.categoriesList = categoriesList.data?.categories
//    }

//    func getMedia() -> [MediaModel] {
//
//        let mediaList = Bundle.main.decode(NetworkResponse<MediaList>.self,
//                                           from: "Episodes.Success.json")
//        self.mediaList = mediaList.data?.media
//        return self.mediaList ?? []
//    }

//    func getChannel() {
//
//        let channelList = Bundle.main.decode(NetworkResponse<ChannelList>.self,
//                                             from: "Channels.Success.json")
//        self.channelList = channelList.data?.channels
//    }
