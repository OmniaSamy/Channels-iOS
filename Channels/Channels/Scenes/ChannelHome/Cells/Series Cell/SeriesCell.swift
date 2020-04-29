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
        seriesImageView.loadImageFromUrl(urlString: latestMedia.coverAsset?.url ?? "", placeHolderImage: nil)
        seriesLabel.text = latestMedia.title
    }
}
