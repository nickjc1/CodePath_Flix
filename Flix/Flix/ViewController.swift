//
//  ViewController.swift
//  Flix
//
//  Created by Chao Jiang on 2/5/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var movieListTBView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .cyan
        
        self.view.addSubview(movieListTBView)
        setMovieListTBViewDelegate()
        configureMovieListTBView()
        
    }
    
    func setMovieListTBViewDelegate() {
        self.movieListTBView.delegate = self
        self.movieListTBView.dataSource = self
    }
    
    func configureMovieListTBView() {
        self.movieListTBView.rowHeight = 100
        
        self.movieListTBView.translatesAutoresizingMaskIntoConstraints = false
        self.movieListTBView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.movieListTBView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.movieListTBView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.movieListTBView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    
    


}

extension MovieListViewController: UITableViewDelegate {}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}



