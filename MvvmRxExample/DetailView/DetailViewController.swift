//
//  DetailViewController.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 5.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController<DetailviewModel> , CollectionReloadProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.collectionProtocol = self
        viewModel.fetchData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        cell.setView(movie : viewModel.popularMovies[indexPath.row],position : indexPath.row)
        cell.favProtocol = viewModel
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.movieClick(position: indexPath.row)
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }

}
