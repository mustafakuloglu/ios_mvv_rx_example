//
//  DetailviewModel.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 6.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit

class DetailviewModel: BaseViewModel, FavProtocol  {
    
    var collectionProtocol : CollectionReloadProtocol? = nil
    var popularMovies = [Movie]()
    var selectedMovie : Movie? = nil
    
    func fetchData()  {
        guard let url = URL(string: getBaseUrl()) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let popularMovies = try JSONDecoder().decode(Popular.self, from: data)
                DispatchQueue.main.async {
                    
                    for var item in popularMovies.results {
                        item.posterPath = "https://image.tmdb.org/t/p/w260_and_h390_bestv2\(item.posterPath)"
                        self.popularMovies.append(item)
                    }
                    self.collectionProtocol?.reloadCollectionView()
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
 
    func setItemFavWhenClickFavButton(newValue: Bool, position: Int) {
        popularMovies[position].isFavorite = newValue
        
    }
    
    func movieClick(position:Int){
        selectedMovie = popularMovies[position]
    }
    
    
}
