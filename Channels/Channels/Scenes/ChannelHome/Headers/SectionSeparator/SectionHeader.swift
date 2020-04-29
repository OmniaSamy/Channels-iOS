//
//  SectionHeader.swift
//  Channels
//
//  Created by Omnia Samy on 4/12/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    let nibName = "SectionHeader"
    private var contentView: UIView!
    
    @IBOutlet private weak var sectionImageView: UIImageView!
    @IBOutlet private weak var sectionTitleLabel: UILabel!
    @IBOutlet private weak var sectionSubTitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        
        contentView = self.loadViewFromNib(nibName: nibName)
        // use bounds not frame or it'll be offset
        contentView?.frame = self.bounds
        // Adding custom subview on top of our view
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(contentView)
    }
    
    func bind(channel: ChannelModel) {
        
        sectionTitleLabel.text = channel.title
        
        if channel.series?.isEmpty ?? true {
            sectionSubTitleLabel.text = String(channel.mediaCount ?? 0) + "  " + L10n.episodes
        } else {
            sectionSubTitleLabel.text = String(channel.mediaCount ?? 0) + "  " + L10n.series
        }
        
        guard let imageURL = channel.iconAsset?.thumbnailUrl else {
            return
        }
        sectionImageView.loadImageFromUrl(urlString: imageURL, placeHolderImage: nil)
    }
}
