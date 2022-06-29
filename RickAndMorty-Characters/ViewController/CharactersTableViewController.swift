//
//  CharactersTableViewController.swift
//  RickAndMorty-Characters
//
//  Created by ilia nikashov on 17.04.2022.
//

import UIKit

class CharactersTableViewController: UITableViewController {

    @IBOutlet weak var characterTableView: UITableView!
    @IBOutlet weak var nextPageButton: UIBarButtonItem!
    @IBOutlet weak var prevPageButton: UIBarButtonItem! {
        didSet {
            prevPageButton.isEnabled = false
        }
    }
    
    private var characters = [Character]()
    private var network = NetworkServises()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async { [self] in
            self.network.fetchCharacters(with: network.baseURL)
            DispatchQueue.main.async{
            self.network.completion = { characters in
                self.characters = characters
                self.tableView.reloadData()
            }
            }
        }
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let character = characters[indexPath.row]
        cell.nameLabel.text = character.name
        cell.genderLabel.text = character.gender
        cell.speciesLabel.text = character.species
        network.getImage(with: character, in: cell.avatarImage)
        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let character = characters[indexPath.row]
                let detailVC = segue.destination as! DetailsViewController
                detailVC.character = character
            }
        }
    }

    
    
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        if sender.tag == 1 {
            network.nextPage()
            prevPageButton.isEnabled = true
        } else if network.pageNumber != 1 {
            network.prevPage()
            network.pageNumber == 1 ? (prevPageButton.isEnabled = false) : (prevPageButton.isEnabled = true)
        }
    }
    
}
