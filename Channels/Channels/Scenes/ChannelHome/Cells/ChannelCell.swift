//
//  ChannelCell.swift
//  Channels
//
//  Created by Omnia Samy on 4/11/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

enum CellType {
    case media
    case channel
}

class ChannelCell: UICollectionViewCell {
    
    private var mediaList: [MediaModel]?
    private var channelModel: ChannelModel?
    private var cellType: CellType?
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: EpisodeCell.className, bundle: nil),
                                forCellWithReuseIdentifier: EpisodeCell.className)
        collectionView.register(UINib(nibName: SeriesCell.className, bundle: nil),
                                forCellWithReuseIdentifier: SeriesCell.className)
    }
    
    func bindMedia(media: [MediaModel]) {
        self.mediaList = media
        self.cellType = .media
        collectionView.reloadData()
    }
    
    func bindChannel(channel: ChannelModel) {
        self.channelModel = channel
        self.cellType = .channel
        collectionView.reloadData()
    }
}

extension ChannelCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch cellType {
        case .media:
            return mediaList?.count ?? 0
        case .channel:
            return channelModel?.latestMedia?.count ?? 0
        case .none:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let epiosedCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: EpisodeCell.className, for: indexPath) as? EpisodeCell else {
                return UICollectionViewCell()
        }
        
        guard let seriesCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: SeriesCell.className, for: indexPath) as? SeriesCell else {
                return UICollectionViewCell()
        }
        
        switch cellType {
        case .media:
            
            guard let media = mediaList?[indexPath.row] else {
                return UICollectionViewCell()
            }
            epiosedCell.bindMedia(media: media)
            return epiosedCell
            
        case .channel:
            
            guard let latestMedia = channelModel?.latestMedia?[indexPath.row] else {
                return UICollectionViewCell()
            }
            
            if channelModel?.series?.isEmpty ?? true {
                
                epiosedCell.bindChannel(latestMedia: latestMedia)
                return epiosedCell
                
            } else {
                seriesCell.bind(latestMedia: latestMedia)
                return seriesCell
            }
            
        case .none:
            return UICollectionViewCell()
        }
    }
    
}

extension ChannelCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size.width - 10
        
        switch  cellType {
        case .media:
            return CGSize(width: collectionViewSize / 2.3, height: 400)
        case .channel:
            if channelModel?.series?.isEmpty ?? true {
                return CGSize(width: collectionViewSize / 2.3, height: 400)
            } else {
                return CGSize(width: collectionViewSize / 1.1, height: 250)
            }
        case .none:
            return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
