//
//  Protocols.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 6.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit


protocol FavProtocol {
    func setItemFavWhenClickFavButton(newValue:Bool,position:Int)
}

protocol CollectionReloadProtocol{
    func reloadCollectionView()
}

