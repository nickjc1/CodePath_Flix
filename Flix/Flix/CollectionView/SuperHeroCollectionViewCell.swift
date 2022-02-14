//
//  SuperHeroCollectionViewCell.swift
//  Flix
//
//  Created by Chao Jiang on 2/13/22.
//

import UIKit

class SuperHeroCollectionViewCell: UICollectionViewCell {
    
    let mvPosterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemBlue
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(mvPosterImageView)
        self.mvPosterIVConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mvPosterIVConfiguration() {
        
        mvPosterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mvPosterImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mvPosterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mvPosterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mvPosterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
}
