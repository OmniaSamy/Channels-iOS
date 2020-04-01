//
//  ComicCell.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class ComicCell: UITableViewCell {
    
    @IBOutlet private weak var comicImageView: UIImageView!
    @IBOutlet private weak var comicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(comic: Comic) {
        comicLabel.text = comic.title
        comicImageView.loadImageFromUrl(urlString: comic.thumbnail.urlString, placeHolderImage: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
