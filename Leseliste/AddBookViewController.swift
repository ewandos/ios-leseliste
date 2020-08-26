//
//  AddBookViewController.swift
//  Leseliste
//
//  Created by Philip Ewert on 24.08.20.
//  Copyright © 2020 Philip Ewert. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {
    @IBOutlet var bookTitle: UITextField!
    @IBOutlet var subtitle: UITextField!
    @IBOutlet var author: UITextField!
    @IBOutlet var okayBtn: UIButton!
    
    var vc: BookListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTitle.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func confirm(_ sender: Any) {
        let book = Book(title: bookTitle.text, subtitle: subtitle.text, author: author.text, imageName: nil, reading: nil, progress: nil)
        vc?.books.append(book)
        vc?.tableView.reloadData()
        dismiss(animated: true)
    }
}
