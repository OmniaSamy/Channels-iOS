//
//  CategoryCell.swift
//  Channels
//
//  Created by Omnia Samy on 4/12/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(category: CategoryModel) {
        categoryNameLabel.text = category.name
    }
}
