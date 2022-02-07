//
//  ViewController.swift
//  Flix
//
//  Created by Chao Jiang on 2/5/22.
//

import UIKit

class MovieListViewController: UIViewController {
    
    var movieListTBView: UITableView = {
        let tableView = UITableView()
//        tableView.rowHeight = 100
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieBriefIntroCell.self, forCellReuseIdentifier: "MovieBriefIntroCell")
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .cyan
        self.title = "Now playing"
        
        //add and configure the movielist tableview into movielist viewcontroller
        self.view.addSubview(movieListTBView)
        setMovieListTBViewDelegate()
        configureMovieListTBView()
    }
    
    func setMovieListTBViewDelegate() {
        self.movieListTBView.delegate = self
        self.movieListTBView.dataSource = self
    }

}

extension MovieListViewController: UITableViewDelegate {
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTBView.dequeueReusableCell(withIdentifier: "MovieBriefIntroCell") as! MovieBriefIntroCell
        
        return cell
    }
    
}



extension MovieListViewController {
    
    func configureMovieListTBView() {
        self.movieListTBView.rowHeight = 100
        
        self.movieListTBView.translatesAutoresizingMaskIntoConstraints = false
        self.movieListTBView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.movieListTBView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.movieListTBView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.movieListTBView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        
        //auto size each row of movielist tableview to fit the content of each movie
        self.movieListTBView.estimatedRowHeight = 100
        self.movieListTBView.rowHeight = UITableView.automaticDimension
        
    }
}



