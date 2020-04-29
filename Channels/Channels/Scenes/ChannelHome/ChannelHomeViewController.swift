//
//  ChannelHomeViewController.swift
//  Channels
//
//  Created by Omnia Samy on 4/8/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class ChannelHomeViewController: UIViewController {
    
    private var homePresenter: ChannelHomePresenter?
    var lastSection: Int?
    
    @IBOutlet private weak var channelCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePresenter = ChannelHomePresenter(delegate: self)
        lastSection = (homePresenter?.getNumberOFsections() ?? 0) - 1
        
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
        return homePresenter?.getNumberOFsections() ?? 0
        //3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case lastSection:
            return homePresenter?.getCategoriesListCount() ?? 0
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == lastSection { // 2
            
            let  cell = channelCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.className,
                                                                  for: indexPath) as? CategoryCell
            
            guard let category = homePresenter?.getCategoryAtIndex(index: indexPath) else {
                return UICollectionViewCell()
            }
            cell?.bind(category: category)
            return cell ?? UICollectionViewCell()
            
        } else if  indexPath.section == 0 {
            
            let cell = channelCollectionView.dequeueReusableCell(withReuseIdentifier: ChannelCell.className,
                                                                 for: indexPath) as? ChannelCell
            cell?.bindMedia(media: homePresenter?.getMedia() ?? [])
            return cell ?? UICollectionViewCell()
            
        } else {
            
            let cell = channelCollectionView.dequeueReusableCell(withReuseIdentifier: ChannelCell.className,
                                                                 for: indexPath) as? ChannelCell
            guard let channel = homePresenter?.getChannelAtIndex(index: (indexPath.section - 1)) else {
                return UICollectionViewCell()
            }
            cell?.bindChannel(channel: channel)
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
            headerView?.bind(title: "New Episodes")
            return headerView ?? UICollectionReusableView()
        case lastSection:
            
            let  headerView = channelCollectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: SectionHeaderTitle.className,
                                                  for: indexPath) as? SectionHeaderTitle
            headerView?.confuigureDesign()
            headerView?.bind(title: "Browse By Categories")
            return headerView ?? UICollectionReusableView()
            
        default:
            let headerView = channelCollectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: SectionHeader.className,
                                                  for: indexPath) as? SectionHeader
            guard let channel = homePresenter?.getChannelAtIndex(index: (indexPath.section - 1)) else {
                return UICollectionReusableView()
            }
            headerView?.bind(channel: channel)
            return headerView ?? UICollectionReusableView()
        }
    }
}

extension ChannelHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size.width
        
        switch indexPath.section {
        case lastSection:
            return CGSize(width: (collectionViewSize - 30) / 2, height: 70)
        case 0:
            return CGSize(width: collectionViewSize, height: 400)
        default:
            
            let channel = homePresenter?.getChannelAtIndex(index: (indexPath.section - 1))
            if channel?.series?.isEmpty ?? true {
                return CGSize(width: collectionViewSize, height: 400)
            } else {
                return CGSize(width: collectionViewSize, height: 250)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case lastSection:
            return UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
        default:
            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        switch section {
        case 0, lastSection:
            return CGSize(width: collectionView.frame.size.width, height: 50)
        default:
            return CGSize(width: collectionView.frame.size.width, height: 105)
        }
    }
}

extension ChannelHomeViewController: HomeDelegate {
    
    func dataDecoded() {
        channelCollectionView.reloadData()
    }
}
