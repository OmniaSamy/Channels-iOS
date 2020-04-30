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
        _ = getCategories()
        _ = getMedia()
        _ = getChannel()
    }
    
    func getNumberOFsections() -> Int {
        return (channelList?.count ?? 0) + 2
    }
    
    func getCategories() {
        
        let categoriesList = Bundle.main.decode(NetworkResponse<CategoryList>.self,
                                                from: "Category.Success.json")
        self.categoriesList = categoriesList.data?.categories
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
    
    //------------------------------
    func getMedia() -> [MediaModel] {
        
        let mediaList = Bundle.main.decode(NetworkResponse<MediaList>.self,
                                           from: "Episodes.Success.json")
        self.mediaList = mediaList.data?.media
        return self.mediaList ?? []
    }
    
    func getMediaListCount() -> Int {
        return mediaList?.count ?? 0
    }
    //-------------------------------
    
    func getChannel() {
        
        let channelList = Bundle.main.decode(NetworkResponse<ChannelList>.self,
                                             from: "Channels.Success.json")
        self.channelList = channelList.data?.channels
    }
    
    func getChannelAtIndex(index: Int) -> ChannelModel? {
        guard let channel = channelList?[index] else {
            return nil
        }
        return channel
    }
}

protocol HomeDelegate: class {
    func dataDecoded()
}
