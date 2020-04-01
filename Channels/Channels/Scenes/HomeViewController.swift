//
//  HomeViewController.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var comicTableView: UITableView!
    
    lazy var comicPresenter: ComicPresenter = {
        return ComicPresenter(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setUpScreen()
    }
}

// MARK: - Private
extension HomeViewController {
    
    private func getData() {
        self.showLoader(view: self.view, type: .native)
        comicPresenter.getData()
    }
    
    private func setUpScreen() {
        comicTableView.dataSource = self
        comicTableView.register(UINib(nibName: ComicCell.className, bundle: nil),
                                forCellReuseIdentifier: ComicCell.className)
        comicTableView.estimatedRowHeight = 130
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicPresenter.getComicListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ComicCell.className, for: indexPath) as? ComicCell else {
                return UITableViewCell()
        }
        
        guard let comic = comicPresenter.getComicAtIndex(index: indexPath) else {
            return UITableViewCell()
        }
        
        cell.bind(comic: comic)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeViewController: homeDelegate {
    
    func getComicSucess() {
        comicTableView.reloadData()
        self.hideLoader()
    }
    
    func getComicFail(errorMessage: String) {
        self.hideLoader()
        self.showErrorMessage(errorMessage: errorMessage)
    }
}
