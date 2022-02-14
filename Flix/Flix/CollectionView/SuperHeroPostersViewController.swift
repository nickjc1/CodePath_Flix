//
//  SuperHeroPostersViewController.swift
//  Flix
//
//  Created by Chao Jiang on 2/13/22.
//

import UIKit

class SuperHeroPostersViewController: UIViewController {
    
    var movies: [[String: Any]] = [[:]]
    
    var superHeroMvCollectionView: UICollectionView = {
        var cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.register(SuperHeroCollectionViewCell.self, forCellWithReuseIdentifier: "superHeroCell")
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superHeroMvCollectionView.collectionViewLayout = collectionViewLayoutConfiguration()
        
        self.view.addSubview(superHeroMvCollectionView)
        self.setupCollectionViewDelegateNDatasource()
        self.spHrCVConfiguration()
        self.fetchData()
        
    }
}


extension SuperHeroPostersViewController: UICollectionViewDelegate {
    func setupCollectionViewDelegateNDatasource() {
        self.superHeroMvCollectionView.delegate = self
        self.superHeroMvCollectionView.dataSource = self
    }
}


extension SuperHeroPostersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = superHeroMvCollectionView.dequeueReusableCell(withReuseIdentifier: "superHeroCell", for: indexPath) as? SuperHeroCollectionViewCell else {return UICollectionViewCell()}
        guard let poster_path = movies[indexPath.row]["poster_path"] as? String else {return cell}
        let base_url = "https://image.tmdb.org/t/p/" + "w780"
        if let posterUrl = URL(string: base_url + poster_path) {
            cell.mvPosterImageView.af.setImage(withURL: posterUrl)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailsViewController = MovieDetailsViewController()
        movieDetailsViewController.movie = self.movies[indexPath.item]
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
}


extension SuperHeroPostersViewController {
    
    func spHrCVConfiguration() {
        superHeroMvCollectionView.translatesAutoresizingMaskIntoConstraints = false
        superHeroMvCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        superHeroMvCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        superHeroMvCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        superHeroMvCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    func collectionViewLayoutConfiguration() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.bounds.width/2 - 10.0, height:   self.view.bounds.height/3.0)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.scrollDirection = .vertical
        return layout
    }
}

extension SuperHeroPostersViewController {
    func fetchData() {
        Fetch.fetchData(urlStr: "https://api.themoviedb.org/3/movie/634649/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed") { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                guard let movies = dataDictionary["results"] as? [[String:Any]] else {return}
                self.movies = movies
//                print(self.movies)
                self.superHeroMvCollectionView.reloadData()
            }
        }
    }
}
