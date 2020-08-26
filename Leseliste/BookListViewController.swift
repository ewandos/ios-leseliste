//
//  FirstViewController.swift
//  Leseliste
//
//  Created by Philip Ewert on 10.08.20.
//  Copyright © 2020 Philip Ewert. All rights reserved.
//

import UIKit

class BookListViewController : UITableViewController {
    var books = [Book]()
    let numberOfUniqueCells = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBook))
        title = "Aktuell"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Dummy Entries
        let book = Book(title: "Der Herr der Ringe", subtitle: "Die Gefährten", author: "J. R. R. Tolkien", imageName: nil, reading: nil, progress: nil)
        let book2 = Book(title: "Der Herr der Ringe", subtitle: "Die zwei Türme", author: "J. R. R. Tolkien", imageName: nil, reading: true, progress: 42)
        let book3 = Book(title: "Der Herr der Ringe", subtitle: "Die Rückkehr des Königs", author: "J. R. R. Tolkien", imageName: nil, reading: true, progress: 18)
        let book4 = Book(title: "Der Hobbit", subtitle: "Die Rückkehr des Königs", author: "J. R. R. Tolkien", imageName: nil, reading: true, progress: 87)
        let book5 = Book(title: "Der Hobbit 2", subtitle: "Die Rückkehr des Königs", author: "J. R. R. Tolkien", imageName: nil, reading: nil, progress: nil)
        books.append(book)
        books.append(book2)
        books.append(book3)
        books.append(book4)
        books.append(book5)
    }

    @objc func addBook() {
        let ac = UIAlertController(title: "Buch hinzufügen", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Manuell", style: .default) {
            [weak self] action in
            if let vc = self?.storyboard?.instantiateViewController(identifier: "AddBook") {
                vc.title = "Buch hinzufügen"
                self?.performSegue(withIdentifier: "AddBookSegue", sender: self)
            }
        })
        ac.addAction(UIAlertAction(title: "Abbrechen", style: .cancel))
        present(ac, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return books.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        default:
            return "Zuletzt hinzugefügt"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentBooksCell") as? CurrentBooksTableViewCell else { fatalError("Could not dequeue 'CurrentBooksCell'-Cell") }
            let currentlyReading = books.filter({ $0.reading })
            cell.currentBooks = currentlyReading
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as? BookTableViewCell else { fatalError("Could not dequeue 'BookCell'-Cell") }

            let index = indexPath.row
            
            cell.bookTitle.text = books[index].title
            cell.bookSubtitle.text = books[index].subtitle
            cell.bookAuthor.text = books[index].author
            cell.bookCover.image = UIImage(named: books[index].imageName)
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddBookViewController {
            vc.vc = self
        }
    }
}

