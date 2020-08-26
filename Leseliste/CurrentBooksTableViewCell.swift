//
//  CurrentBooksTableViewCell.swift
//  Leseliste
//
//  Created by Philip Ewert on 26.08.20.
//  Copyright © 2020 Philip Ewert. All rights reserved.
//

import UIKit

class CurrentBooksTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var collectionView: UICollectionView!
    
    var currentBooks = [Book]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentBookCell", for: indexPath) as? CurrentBooksCollectionViewCell else { fatalError("Could not dequeue 'CurrentBookCell'-Cell")}
        cell.readingProgress.text = "\(currentBooks[indexPath.item].progress)%"
        return cell
    }
}
