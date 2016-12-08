//
//  ViewController.swift
//
//  Created by Mike MacDougall on 12/8/16.
//  Copyright © 2016 Etsy. All rights reserved.
//

import UIKit
import VIPERBuilder

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    lazy var viperBuilder:
        VIPERBuilder<DemoInteractor, DemoPresenter, DemoRouter> = {
        return VIPERBuilder(controller: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "VIPERBuilder Demo"
        automaticallyAdjustsScrollViewInsets = false
        
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = viperBuilder.presenter
        collectionView.dataSource = viperBuilder.presenter
        collectionView.register(DemoCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        pinCollectionViewToEdges()
        viperBuilder.presenter.collectionView = collectionView
        
        viperBuilder.presenter.initialLoad()
    }
    
    func pinCollectionViewToEdges() {
        let top = NSLayoutConstraint(item: collectionView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: topLayoutGuide,
                                     attribute: .bottom,
                                     multiplier: 1,
                                     constant: 0)
        top.isActive = true
        let bottom = NSLayoutConstraint(item: collectionView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: bottomLayoutGuide,
                                        attribute: .top,
                                        multiplier: 1,
                                        constant: 0)
        bottom.isActive = true
        let left = NSLayoutConstraint(item: collectionView,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .left,
                                      multiplier: 1,
                                      constant: 0)
        left.isActive = true
        let right = NSLayoutConstraint(item: collectionView,
                                       attribute: .right,
                                       relatedBy: .equal,
                                       toItem: view,
                                       attribute: .right,
                                       multiplier: 1,
                                       constant: 0)
        right.isActive = true
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

