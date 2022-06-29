//
//  DetailsViewController.swift
//  RickAndMorty-Characters
//
//  Created by ilia nikashov on 17.04.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var character: Character!
    private var network = NetworkServises()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lastLocationLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView! {
        didSet {
            avatarImage.contentMode = .scaleAspectFill
            avatarImage.clipsToBounds = true
            avatarImage.layer.cornerRadius = avatarImage.bounds.height / 4
            avatarImage.backgroundColor = .white
        }
    }


    override func viewDidLoad() {
        self.nameLabel.text = "Name:           \(character.name)"
        self.speciesLabel.text = "Species:          \(character.species)"
        self.genderLabel.text  = "Gender:           \(character.gender)"
        self.statusLabel.text  = "Status:            \(character.status)"
        self.lastLocationLabel.text = "Last location:   \(character.location)"
        self.episodesLabel.text = "Number of episodes:   \(character.episodesNumber)"
        network.getImage(with: character, in: avatarImage)
    }
}
