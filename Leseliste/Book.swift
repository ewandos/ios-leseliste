//
//  Book.swift
//  Leseliste
//
//  Created by Philip Ewert on 10.08.20.
//  Copyright © 2020 Philip Ewert. All rights reserved.
//

import Foundation

class Book {
    var title: String
    var subtitle: String
    var author: String
    var imageName: String
    var reading: Bool
    var progress: Int
    
    init(title: String?, subtitle: String?, author: String?, imageName: String?, reading: Bool?, progress: Int?) {
        self.title = title ?? ""
        self.subtitle = subtitle ?? ""
        self.author = author ?? ""
        self.imageName = imageName ?? "book_cover"
        self.reading = reading ?? false
        self.progress = progress ?? 0
    }
}
