//
//  MovieCell.swift
//  MovieDB
//
//  Created by Sergio Murilo on 17/06/22.
//

import UIKit
import Kingfisher

final class MovieCell: UICollectionViewCell {
    
    @IBOutlet private weak var posterImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImage.image = nil
    }
    
    func setUp(link: String, tag: Int) {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))

        DispatchQueue.main.async {
            self.contentView.backgroundColor = .black
                guard let url = URL(string: link) else {
                    return
                }
                self.posterImage.isUserInteractionEnabled = true
                self.posterImage.tag = tag
                self.posterImage.addGestureRecognizer(tapGestureRecognizer)
                self.posterImage.kf.setImage(with: url)
                self.posterImage.layer.cornerRadius = 16
                self.posterImage.layer.masksToBounds = true
            
        }
       
    }
    
    @IBAction func tap(_ sender:AnyObject){
        let router = MoviesDBRouter()
        router.titleView()
    }
    
}
