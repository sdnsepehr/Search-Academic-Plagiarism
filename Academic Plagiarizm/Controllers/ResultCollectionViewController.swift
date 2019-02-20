//
//  ResultCollectionViewController.swift
//  Academic Plagiarizm
//
//  Created by AHG on 2/19/19.
//  Copyright © 2019 Microcis. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ResultCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var searchedTheses = [
        Thesis(["title": "How to Prevent Software Piracy?", "id": "10670", "university": "Herat University", "faculty": "Computer Science", "year": "2012", "isReported": false]),
        Thesis(["title": "Preventing software piracy in Afghanistan", "id": "46173", "university": "Kabul University", "faculty": "Computer Science", "year": "2018", "isReported": true]),
        Thesis(["title": "How to Stop Software Piracy", "id": "67585", "university": "Kabul Polytechnic University", "faculty": "Computer Science", "year": "205", "isReported": false]),
        Thesis(["title": "Methods to Stop Sofware Piracy", "id": "54976", "university": "Kandahar University", "faculty": "Computer  Science", "year": "2014", "isReported": false]),
    ];

    override func viewDidLoad() {
        super.viewDidLoad();
        self.collectionView.backgroundColor = UIColor(r: 234, g: 239, b: 246);
        self.collectionView!.register(SearchResultCell.self, forCellWithReuseIdentifier: reuseIdentifier);
        self.collectionView.delegate = self;
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.navigationController?.setNavigationBarHidden(false, animated: false);
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return searchedTheses.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchResultCell;
        cell.thesis = searchedTheses[indexPath.row];
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 150);
    }
}
