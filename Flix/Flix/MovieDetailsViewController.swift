//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Chao Jiang on 2/10/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController, UINavigationControllerDelegate {
    
    var movie = [String:Any]()
    
    let movieBackImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let movieDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    let movieDetailTextView: UITextView = {
       let textView = UITextView()
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .justified
        textView.font = .systemFont(ofSize: 15)
        textView.textColor = .systemGray3
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        return textView
    }()
    
}

extension MovieDetailsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title = self.movie["title"] as? String {
            self.navigationItem.title = title
        }
        
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 18)]
        
        self.view.addSubview(movieBackImageView)
        movieBackImageViewConfiguration()
        
        self.view.addSubview(moviePosterImageView)
        moviePosterImageViewConfiguration()
        
        self.view.addSubview(movieTitleLabel)
        movieTitleLabelConfiguration()
        
        self.view.addSubview(movieDateLabel)
        movieDateLabelConfiguration()
        
        self.view.addSubview(movieDetailTextView)
        movieDetailTextViewConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
        print("dismissed")
    }
}


extension MovieDetailsViewController {
    
    func movieBackImageViewConfiguration() {
        if let backDropPath = movie["backdrop_path"] as? String {
            let baseUrl = "https://image.tmdb.org/t/p/" + "w780"
            if let backDropUrl = URL(string: baseUrl + backDropPath) {
                movieBackImageView.af.setImage(withURL: backDropUrl)
            }
        }
        movieBackImageView.translatesAutoresizingMaskIntoConstraints = false
        movieBackImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieBackImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        movieBackImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        movieBackImageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30).isActive = true
    }
    
    func moviePosterImageViewConfiguration() {
        if let posterPath = movie["poster_path"] as? String {
            let baseUrl = "https://image.tmdb.org/t/p/" + "w780"
            if let posterUrl = URL(string: baseUrl + posterPath) {
                moviePosterImageView.af.setImage(withURL: posterUrl)
            }
        }
        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        moviePosterImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        moviePosterImageView.centerYAnchor.constraint(equalTo: self.movieBackImageView.bottomAnchor).isActive = true
        moviePosterImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        moviePosterImageView.widthAnchor.constraint(equalTo: moviePosterImageView.heightAnchor, multiplier: 3/4).isActive = true
    }
    
    func movieTitleLabelConfiguration() {
        if let title = self.movie["title"] as? String {
            movieTitleLabel.text = title
        }
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: self.movieBackImageView.bottomAnchor).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: self.moviePosterImageView.trailingAnchor, constant: 10).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func movieDateLabelConfiguration() {
        if let date = self.movie["release_date"] as? String {
            movieDateLabel.text = date
        }
        
        movieDateLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDateLabel.leadingAnchor.constraint(equalTo: self.movieTitleLabel.leadingAnchor).isActive = true
        movieDateLabel.topAnchor.constraint(equalTo: self.movieTitleLabel.bottomAnchor).isActive = true
        movieDateLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        movieDateLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func movieDetailTextViewConfiguration() {
        if let detail = self.movie["overview"] as? String {
            self.movieDetailTextView.text = detail
        }
        movieDetailTextView.translatesAutoresizingMaskIntoConstraints = false
        movieDetailTextView.topAnchor.constraint(equalTo: self.moviePosterImageView.bottomAnchor, constant: 10).isActive = true
        movieDetailTextView.leadingAnchor.constraint(equalTo: self.moviePosterImageView.leadingAnchor).isActive = true
        movieDetailTextView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        movieDetailTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}
