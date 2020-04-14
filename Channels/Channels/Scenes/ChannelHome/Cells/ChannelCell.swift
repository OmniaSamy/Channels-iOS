//
//  ChannelCell.swift
//  Channels
//
//  Created by Omnia Samy on 4/11/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class ChannelCell: UICollectionViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: EpisodeCell.className, bundle: nil),
                                forCellWithReuseIdentifier: EpisodeCell.className)
    }
    
    func bind() {
        
    }
}

extension ChannelCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCell.className,
                                                      for: indexPath)
        return cell
    }
}

extension ChannelCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size.width - 10
        return CGSize(width: collectionViewSize / 2.3, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
