//
//  BookTableViewCell.swift
//  Leseliste
//
//  Created by Philip Ewert on 26.08.20.
//  Copyright © 2020 Philip Ewert. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet var bookCover: UIImageView!
    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookSubtitle: UILabel!
    @IBOutlet var bookAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
