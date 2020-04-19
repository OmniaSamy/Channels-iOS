//
//  ChannelHomeViewController.swift
//  Channels
//
//  Created by Omnia Samy on 4/8/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class ChannelHomeViewController: UIViewController {
    
    @IBOutlet private weak var channelCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Channels"
        channelCollectionView.dataSource = self
        channelCollectionView.delegate = self
        channelCollectionView.register(UINib(nibName: ChannelCell.className, bundle: nil),
                                       forCellWithReuseIdentifier: ChannelCell.className)
        
        channelCollectionView.register(UINib(nibName: CategoryCell.className, bundle: nil),
                                       forCellWithReuseIdentifier: CategoryCell.className)
        
        channelCollectionView.register(SectionHeader.self,
                                       forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                       withReuseIdentifier: SectionHeader.className)
        
        channelCollectionView.register(SectionHeaderTitle.self,
                                       forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                       withReuseIdentifier: SectionHeaderTitle.className)
    }
}

extension ChannelHomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 2:
            return 8
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 2 {
            
            let  cell = channelCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.className,
                                                                  for: indexPath) as? CategoryCell
            return cell ?? UICollectionViewCell()
        } else {
            let cell = channelCollectionView.dequeueReusableCell(withReuseIdentifier: ChannelCell.className,
                                                                 for: indexPath) as? ChannelCell
            cell?.bind()
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            
            let  headerView = channelCollectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: SectionHeaderTitle.className,
                                                  for: indexPath) as? SectionHeaderTitle
            headerView?.confuigureDesignWithOutSeparator()
            return headerView ?? UICollectionReusableView()
        case 2:
            
            let  headerView = channelCollectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: SectionHeaderTitle.className,
                                                  for: indexPath) as? SectionHeaderTitle
            headerView?.confuigureDesign()
            return headerView ?? UICollectionReusableView()
            
        default:
            let headerView = channelCollectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: SectionHeader.className,
                                                  for: indexPath)
            return headerView
        }
    }
}

extension ChannelHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size.width
        
        if indexPath.section == 2 {
            return CGSize(width: (collectionViewSize - 30) / 2, height: 70)
        } else {
            return CGSize(width: collectionViewSize, height: 400)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 2:
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        default:
            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        switch section {
        case 0, 2:
            return CGSize(width: collectionView.frame.size.width, height: 50)
        default:
            return CGSize(width: collectionView.frame.size.width, height: 105)
        }
    }
}
