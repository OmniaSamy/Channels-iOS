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
    
    @IBOutlet private weak var stopTimeDetailsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        
        contentView = loadViewFromNib()
        // use bounds not frame or it'll be offset
        contentView?.frame = self.bounds
        // Adding custom subview on top of our view
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(contentView)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
