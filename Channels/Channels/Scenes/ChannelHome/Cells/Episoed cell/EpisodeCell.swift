//
//  EpisodeCell.swift
//  Channels
//
//  Created by Omnia Samy on 4/8/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class EpisodeCell: UICollectionViewCell {
    
    @IBOutlet private weak var episodeImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(media: MediaModel) {
        
        guard let mediaURL = media.coverAsset?.url else {
            return
        }
        episodeImageView.loadImageFromUrl(urlString: mediaURL, placeHolderImage: nil)
        
        titleLabel.text = media.title
        typeLabel.text = media.type
    }
    
    func bindChannel(latestMedia: LatestMedia) {
        
        guard let mediaURL = latestMedia.coverAsset?.url else {
            return
        }
        episodeImageView.loadImageFromUrl(urlString: mediaURL, placeHolderImage: nil)
        
        titleLabel.text = latestMedia.title
        typeLabel.text = latestMedia.type
    }
}
