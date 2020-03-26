//
//  HomeViewController.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var comicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getData()
    }
}


extension HomeViewController {
    
    func getData() {
        NetworkManager.shared.getComics(completion: { (result: Result<MarvelResults, NetworkError>, _) in
            
            switch result {
            case .success(let comics):
                print(comics.results)
                //                self.comicList = comics.results
            //                self.delegate?.getComicSucess()
            case .failure(let error):
                print(error)
                //                self.delegate?.getComicFail(errorMessage: error.message ?? "")
            }
        })
    }
}
