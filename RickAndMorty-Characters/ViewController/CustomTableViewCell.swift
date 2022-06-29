//
//  CustomTableViewCell.swift
//  RickAndMorty-Characters
//
//  Created by ilia nikashov on 17.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView! {
        didSet {
            avatarImage.contentMode = .scaleAspectFit
            avatarImage.clipsToBounds = true
            avatarImage.layer.cornerRadius = avatarImage.bounds.height / 4
            avatarImage.backgroundColor = .white
        }
    }
}

