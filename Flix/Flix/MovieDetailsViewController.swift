//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Chao Jiang on 2/10/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie = [String:Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = self.movie["title"] as? String {
            self.title = title
        }
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = false

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}

