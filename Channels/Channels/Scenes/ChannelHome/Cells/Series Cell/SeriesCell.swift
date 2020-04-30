//
//  SeriesCell.swift
//  Channels
//
//  Created by Omnia Samy on 4/28/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class SeriesCell: UICollectionViewCell {
    
    @IBOutlet private weak var seriesImageView: UIImageView!
    @IBOutlet private weak var seriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(latestMedia: LatestMedia) {
        
        seriesLabel.text = latestMedia.title
        
        guard let imageUrl = latestMedia.coverAsset?.url else {
            return
        }
        seriesImageView.loadImageFromUrl(urlString: imageUrl, placeHolderImage: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        seriesImageView.image = nil
    }
}
