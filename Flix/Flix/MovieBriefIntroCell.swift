//
//  MovieBriefIntroCell.swift
//  Flix
//
//  Created by Chao Jiang on 2/6/22.
//

import UIKit

class MovieBriefIntroCell: UITableViewCell {
    
    var poster: UIImageView = {
        let poster = UIImageView()
        poster.backgroundColor = .blue
        poster.contentMode = .scaleAspectFill
        return poster
    }()
    
    var title: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 15)
        title.textAlignment = .left
        title.numberOfLines = 0
        return title
    }()
    
    var intro: UITextView = {
        let intro = UITextView()
        intro.isUserInteractionEnabled = false
        intro.textColor = .gray
        intro.textAlignment = .left
        intro.isScrollEnabled = false
        intro.backgroundColor = .clear
        return intro
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(poster)
        setupPosterConstraints()
        self.addSubview(title)
        setupTitleConstraints()
        self.addSubview(intro)
        setupIntroConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieBriefIntroCell {
    
    func setupPosterConstraints() {
        self.poster.translatesAutoresizingMaskIntoConstraints = false
        self.poster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.poster.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.poster.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.poster.widthAnchor.constraint(equalTo: self.poster.heightAnchor, multiplier: 9/16).isActive = true
    }
    
    func setupTitleConstraints() {
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.title.leadingAnchor.constraint(equalTo: self.poster.trailingAnchor, constant: 10).isActive = true
        self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.title.topAnchor.constraint(equalTo: self.poster.topAnchor).isActive = true
        self.title.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupIntroConstraints() {
        self.intro.translatesAutoresizingMaskIntoConstraints = false
        self.intro.leadingAnchor.constraint(equalTo: self.title.leadingAnchor).isActive = true
        self.intro.trailingAnchor.constraint(equalTo: self.title.trailingAnchor).isActive = true
        self.intro.topAnchor.constraint(equalTo: self.title.bottomAnchor).isActive = true
        self.intro.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
}
