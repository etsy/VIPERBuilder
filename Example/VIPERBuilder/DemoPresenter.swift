//
//  DemoPresenter.swift
//
//  Created by Mike MacDougall on 1/20/17.
//  Copyright © 2017 Etsy. All rights reserved.
//

import UIKit
import VIPERBuilder

class DemoPresenter: VIPERPresenter, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var viewModel = DemoViewModel(numberOfItems: 0)
    weak var collectionView: UICollectionView?
    
    // MARK: Loading and Updating
    func initialLoad() {
        guard let interactor = interactor as? DemoInteractor else { return }
        interactor.loadNumberOfItems()
    }
    
    func update(numberOfItems: Int) {
        viewModel = DemoViewModel(numberOfItems: numberOfItems)
        collectionView?.reloadData()
    }
    
    func invertAndUpdate(index: Int) {
        viewModel.invertColorAtIndex(index: index)
        let path = IndexPath(item: index, section: 0)
        collectionView?.reloadItems(at: [path])
    }
    
    // MARK: Cell Configuration
    func configureCell(cell: UICollectionViewCell, indexPath: IndexPath) {
        guard let cell = cell as? DemoCell else { return }
        guard let itemModel = viewModel.item(index: indexPath.item) else { return }
        cell.backgroundColor = itemModel.color
        cell.setTitle(title: itemModel.actionDescription())
        cell.setTitleColor(color: itemModel.titleColor)
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let interactor = interactor as? DemoInteractor else { return }
        guard let item = viewModel.item(index: indexPath.item) else { return }
        interactor.didSelectItem(index: indexPath.item, actionType: item.actionType)
    }
}
