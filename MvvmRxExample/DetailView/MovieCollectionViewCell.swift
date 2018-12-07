//
//  MovieCollectionViewCell.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 6.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detail: UITextView!
    
    let viewModel = MovieCollectionViewCellViewModel()
    
    
    var favProtocol:FavProtocol?
    var position:Int?
    
    var movie:Movie? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @IBAction func favAction(_ sender: Any) {
        let flag : Bool = self.movie?.isFavorite ?? false
        favProtocol?.setItemFavWhenClickFavButton(newValue: !flag, position:position ?? 0)
        self.movie?.isFavorite = !flag
        setFavotite()
    }
    
    func setView(movie:Movie , position: Int){
        self.movie = movie
        self.position = position
        titleLabel.text = movie.originalTitle;
        detailLabel.text=movie.title
        detail.textContainer.heightTracksTextView = true
        detail.isScrollEnabled = false
        detail.text = movie.overview
        image.image = image.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        image.tintColor = UIColor.white
        //        image.load(urlString: movie.posterPath)
        image.isFetchIfNeededImage(urlString: movie.posterPath)
        setFavotite()
    }
    func setFavotite(){
        if(self.movie?.isFavorite ?? false)
        {
            self.favButton.setImage(UIImage(named: "fav"), for: .normal)
            
            
        } else
        {
            self.favButton.setImage(UIImage(named: "unfav"), for: .normal)
            
        }
        
    }
}
