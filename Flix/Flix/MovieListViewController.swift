//
//  ViewController.swift
//  Flix
//
//  Created by Chao Jiang on 2/5/22.
//

import UIKit
import AlamofireImage

class MovieListViewController: UIViewController {
    
    var movieListTBView: UITableView = {
        let tableView = UITableView()
        tableView.register(MovieBriefIntroCell.self, forCellReuseIdentifier: "MovieBriefIntroCell")
        return tableView
    }()
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Now Playing"
        self.networkConnecting()
        
        //add and configure the movielist tableview into movielist viewcontroller
        self.view.addSubview(movieListTBView)
        setMovieListTBViewDelegate()
        configureMovieListTBView()
    }

}

extension MovieListViewController: UITableViewDelegate {
    
    func setMovieListTBViewDelegate() {
        self.movieListTBView.delegate = self
        self.movieListTBView.dataSource = self
    }
    
}


extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTBView.dequeueReusableCell(withIdentifier: "MovieBriefIntroCell") as! MovieBriefIntroCell
        guard let movieTitle = movies[indexPath.row]["title"] as? String else {return cell}
        cell.title.text = movieTitle
        guard let overview = movies[indexPath.row]["overview"] as? String else {return cell}
        cell.intro.text = overview
        guard let poster_path = movies[indexPath.row]["poster_path"] as? String else {return cell}
        let base_url = "https://image.tmdb.org/t/p/" + "w185"
        if let posterUrl = URL(string: base_url + poster_path) {
            cell.poster.af.setImage(withURL: posterUrl)
        }
        return cell
    }
    
    //select the certain row of tableview to go to next viewcontroller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigationController?.modalPresentationStyle = .fullScreen
//        present(MovieDetailsViewController(), animated: true)
        
        let movieDetailViewController = MovieDetailsViewController()
        movieDetailViewController.movie = self.movies[indexPath.row]
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
        
        self.movieListTBView.deselectRow(at: indexPath, animated: true)
        
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
//        self.movieListTBView.estimatedRowHeight 
        self.movieListTBView.rowHeight = UITableView.automaticDimension
        
    }
}


extension MovieListViewController {
    func networkConnecting() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // TODO: Get the array of movies
                guard let movies = dataDictionary["results"] as? [[String:Any]] else {return}
                
                // TODO: Store the movies in a property to use elsewhere
                self.movies = movies
                
                // TODO: Reload your table view data
                self.movieListTBView.reloadData()
             }
        }
        task.resume()
    }
}




