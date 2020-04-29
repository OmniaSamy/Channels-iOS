//
//  SectionHeaderTitle.swift
//  Channels
//
//  Created by Omnia Samy on 4/19/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class SectionHeaderTitle: UICollectionReusableView {
    
    let nibName = "SectionHeaderTitle"
    private var contentView: UIView!
    
    @IBOutlet private weak var separatorView: UIView!
    @IBOutlet private weak var sectionTitleLabel: UILabel!
    @IBOutlet private weak var topPin: NSLayoutConstraint!
    
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
    
    func confuigureDesignWithOutSeparator() {
        separatorView.isHidden = true
        topPin.constant = 0
    }
    
    func confuigureDesign() {
        separatorView.isHidden = false
        topPin.constant = 20
    }
    
    func bind(title: String) {
        sectionTitleLabel.text = title
    }
}
